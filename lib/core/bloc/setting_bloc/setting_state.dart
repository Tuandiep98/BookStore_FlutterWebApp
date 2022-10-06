part of 'setting_bloc.dart';

abstract class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends SettingState {}

class ThemeLoaded extends SettingState {
  final ThemeData themeData;

  const ThemeLoaded({
    required this.themeData,
  });

  @override
  List<Object> get props => [themeData];
}
