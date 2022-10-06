part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class ThemeStarted extends SettingEvent {}

class ThemeChaged extends SettingEvent {
  final bool setToDark;

  const ThemeChaged({
    required this.setToDark,
  });

  @override
  List<Object> get props => [setToDark];
}
