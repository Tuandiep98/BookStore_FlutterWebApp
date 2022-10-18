import 'package:bloc/bloc.dart';
import 'package:book_store/Utils/storage_manager.dart';
import 'package:book_store/core/global/global_data.dart';
import 'package:book_store/core/global/locator.dart';
import 'package:book_store/core/services/interfaces/ifirebase_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'setting_event.dart';
part 'setting_state.dart';

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

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  var _firebaseService = locator<IFirebaseService>();
  var _globalData = locator<GlobalData>();

  late ThemeData _themeData = lightTheme;
  ThemeData getTheme() => _themeData;

  bool _isDarkMode = false;
  bool isDarkMode() => _isDarkMode;
  SettingBloc() : super(ThemeLoaded(themeData: lightTheme)) {
    on<ThemeStarted>((event, emit) {
      StorageManager.readData('themeMode').then((value) {
        print('value read from storage: ' + value.toString());
        var themeMode = value ?? 'light';
        if (themeMode == 'light') {
          print('setting light theme');
          setLightMode();
        } else {
          print('setting dark theme');
          setDarkMode();
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

    on<GoogleSigninClicked>((event, emit) async {
      GoogleSignInAccount account;
      if (_globalData.currentUser != null) {
        account = _globalData.currentUser!;
      } else {
        account = await signInWithGoogle();
      }
      emit(ThemeLoadedWithAccount(account, themeData: _themeData));
    });

    on<SignoutClicked>((event, emit) async {
      if (_globalData.currentUser != null) {
        await signOut();
      }
      emit(ThemeLoaded(themeData: _themeData));
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

  Future<GoogleSignInAccount> signInWithGoogle() async {
    var currentUser = await _firebaseService.signInWithGoogle();
    _globalData.currentUser = currentUser!;
    return currentUser;
  }

  Future<void> signOut() async {
    await _firebaseService.signOut();
    _globalData.currentUser = null;
  }
}
