part of 'app_settings_bloc.dart';

@immutable
sealed class AppSettingsEvent {}

class GetInitialSettingsEvent extends AppSettingsEvent {}

class GetInitialModeEvent extends AppSettingsEvent {}

class LanguageChangeEvent extends AppSettingsEvent {
  final String localeCode;
  LanguageChangeEvent(this.localeCode);

  @override
  List<Object> get props => [localeCode];
}

class ModeChangeEvent extends AppSettingsEvent {}

