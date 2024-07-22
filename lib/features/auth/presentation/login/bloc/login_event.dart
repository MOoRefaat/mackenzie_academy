part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class ValidateStoredDataEvent extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ValidateEmailEvent extends LoginEvent {
  final String userName;

  ValidateEmailEvent({required this.userName});

  @override
  List<Object?> get props => [userName];
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

// Api's call
class CallApiLoginEvent extends LoginEvent {
  final String userName;
  final String password;

  CallApiLoginEvent({required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}


// navigate
class NavigateToRegisterScreenEvent extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NavigateHomeScreenEvent extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

// class NavigateToUserHomeScreenEvent extends LoginEvent {
//   @override
//   List<Object?> get props => throw UnimplementedError();
// }
//
// class NavigateToAdminHomeScreenEvent extends LoginEvent {
//   @override
//   List<Object?> get props => throw UnimplementedError();
// }
//
// class NavigateToCoachHomeScreenEvent extends LoginEvent {
//   @override
//   List<Object?> get props => throw UnimplementedError();
// }
