part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class IsPasswordMatchEvent extends RegisterEvent {
  final String password;
  final String confirmPassword;

  IsPasswordMatchEvent({required this.password, required this.confirmPassword});

  @override
  List<Object?> get props => [password, confirmPassword];
}

class RegisterButtonEvent extends RegisterEvent {
  final String userName;
  final String email;
  final String password;

  RegisterButtonEvent(
      {required this.email, required this.password, required this.userName});

  @override
  List<Object?> get props => [email, password];
}

// Api's call
class CallFirebaseRegisterEvent extends RegisterEvent {
  final String userName;
  final String email;
  final String password;

  CallFirebaseRegisterEvent(
      {required this.email, required this.password, required this.userName});

  @override
  List<Object?> get props => [email, password];
}

// navigate
class NavigateToHomeScreenEvent extends RegisterEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
