part of 'adding_users_bloc.dart';

@immutable
abstract class AddingUsersEvent {}

class RegisterButtonEvent extends AddingUsersEvent {
  final String email;
  final String password;
  final String userName;
  final String role;

  RegisterButtonEvent({
    required this.email,
    required this.password,
    required this.userName,
    required this.role,
  });
}

class CallFirebaseRegisterEvent extends AddingUsersEvent {
  final String email;
  final String password;
  final String userName;
  final String role;

  CallFirebaseRegisterEvent({
    required this.email,
    required this.password,
    required this.userName,
    required this.role,
  });
}

class NavigateToHomeScreenEvent extends AddingUsersEvent {}

class IsPasswordMatchEvent extends AddingUsersEvent {
  final String password;
  final String confirmPassword;

  IsPasswordMatchEvent({
    required this.password,
    required this.confirmPassword,
  });
}

class RoleSelectedEvent extends AddingUsersEvent {
  final String role;

  RoleSelectedEvent(this.role);
}