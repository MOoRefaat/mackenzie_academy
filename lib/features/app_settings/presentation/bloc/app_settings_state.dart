part of 'app_settings_bloc.dart';

@immutable
sealed class AppSettingsState {}

final class AppSettingsInitialState extends AppSettingsState {}

final class GetInitialSettingsState extends AppSettingsState {
  final String language;
  final bool isDark;

  GetInitialSettingsState(this.language,this.isDark);

  List<Object?> get props => [language,isDark];
}

final class GetInitialModeState extends AppSettingsState {
  final bool isDark;

  GetInitialModeState(this.isDark);

  List<Object?> get props => [isDark];
}

// lang.
final class LanguageChangeLoadingState extends AppSettingsState {}

final class LanguageChangeSuccessState extends AppSettingsState {}

final class LanguageChangeFailState extends AppSettingsState {
  final String message;

  LanguageChangeFailState(this.message);

  List<Object?> get props => [message];
}

// mode
final class ModeChangeLoadingState extends AppSettingsState {}

final class ModeChangeSuccessState extends AppSettingsState {}

final class ModeChangeFailState extends AppSettingsState {
  final String message;

  ModeChangeFailState(this.message);

  List<Object?> get props => [message];
}

// net work error
class NetworkErrorState extends AppSettingsState {
  final String message;

  NetworkErrorState(this.message);

  List<Object?> get props => [message];
}