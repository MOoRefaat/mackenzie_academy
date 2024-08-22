part of 'app_settings_bloc.dart';

@immutable
sealed class AppSettingsState {}

final class AppSettingsInitialState extends AppSettingsState {}

final class LanguageChangeState extends AppSettingsState {}

final class ModeChangeState extends AppSettingsState {}

