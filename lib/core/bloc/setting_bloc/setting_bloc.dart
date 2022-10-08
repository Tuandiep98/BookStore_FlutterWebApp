import 'package:bloc/bloc.dart';
import 'package:book_store/Utils/storage_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    dialogBackgroundColor: Colors.grey[600],
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xffF2F5F7),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    dialogBackgroundColor: Colors.grey[200],
  );

  late ThemeData _themeData = lightTheme;
  ThemeData getTheme() => _themeData;

  bool _isDarkMode = false;
  bool isDarkMode() => _isDarkMode;

  SettingBloc() : super(ThemeInitial()) {
    on<ThemeStarted>((event, emit) {
      StorageManager.readData('themeMode').then((value) {
        print('value read from storage: ' + value.toString());
        var themeMode = value ?? 'light';
        if (themeMode == 'light') {
          print('setting light theme');
          setLightMode();
        } else {
          print('setting dark theme');
          setLightMode();
        }
      });
      emit(ThemeLoaded(themeData: _themeData));
    });

    on<ThemeChaged>((event, emit) {
      final state = this.state;
      if (state is ThemeLoaded) {
        if (event.setToDark) {
          setDarkMode();
        } else {
          setLightMode();
        }
        emit(ThemeLoaded(themeData: _themeData));
      }
    });
  }

  void setDarkMode() {
    _themeData = darkTheme;
    _isDarkMode = true;
    StorageManager.saveData('themeMode', 'dark');
  }

  void setLightMode() {
    _isDarkMode = false;
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
  }
}
