part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class ValidateStoredDataEvent extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ValidateEmailEvent extends LoginEvent {
  final String email;

  ValidateEmailEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class ValidatePasswordEvent extends LoginEvent {
  final String password;

  ValidatePasswordEvent({required this.password});

  @override
  List<Object?> get props => [password];
}

class LoginButtonEvent extends LoginEvent {
  final String email;
  final String password;

  LoginButtonEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

// Firebase's call
class CallFirebaseLoginEvent extends LoginEvent {
  final String email;
  final String password;

  CallFirebaseLoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}


// navigate
class NavigateToRegisterScreenEvent extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NavigateHomeScreenEvent extends LoginEvent {
  final UserType userType;

  NavigateHomeScreenEvent({required this.userType});

  @override
  List<Object?> get props => [userType];
}

