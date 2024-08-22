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

class ValidateStoredDataState extends LoginState {
  final String email;
  final String password;
  final bool isRememberMe;

  ValidateStoredDataState(this.email, this.password,this.isRememberMe);
}

class ValidLoginFormState extends LoginState {
  final String email;
  final String password;
  final bool isRememberMe;

  ValidLoginFormState(this.email, this.password,this.isRememberMe);
}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String userRole;

  LoginSuccessState(this.userRole);

  @override
  List<Object?> get props => [userRole];
}

class LoginFailState extends LoginState {
  final String messageKey;

  LoginFailState(this.messageKey);

  @override
  List<Object?> get props => [messageKey];
}

// net work error
class NetworkErrorState extends LoginState {
  final String message;

  NetworkErrorState(this.message);

  List<Object?> get props => [message];
}

// navigate
class NavigateToRegisterScreenState extends LoginState {}

class NavigateToHomeScreenState extends LoginState {
  final UserType userType;

  NavigateToHomeScreenState(this.userType);

  @override
  List<Object?> get props => [userType];
}
