part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class EmailEmptyFormatState extends LoginState {
  final String emailValidatorMessage;

  EmailEmptyFormatState({required this.emailValidatorMessage});
}

class EmailFormatCorrectState extends LoginState {}

class PasswordEmptyFormatState extends LoginState {
  final String passwordValidatorMessage;

  PasswordEmptyFormatState({required this.passwordValidatorMessage});
}

class PasswordFormatCorrectState extends LoginState {}

class ValidLoginFormState extends LoginState {
  final String userName;
  final String password;

  ValidLoginFormState(this.userName, this.password);
}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginResponse user;

  LoginSuccessState(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginFailState extends LoginState {
  final String messageKey;

  LoginFailState(this.messageKey);

  @override
  List<Object?> get props => [messageKey];
}

// navigate
class NavigateToRegisterScreenState extends LoginState {}

class NavigateToHomeScreenState extends LoginState {}
