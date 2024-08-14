part of 'adding_users_bloc.dart';

@immutable
sealed class AddingUsersState {}

final class RegisterInitial extends AddingUsersState {}

class PasswordMatchState extends AddingUsersState {}

class PasswordNotMatchState extends AddingUsersState {
  final String message;

  PasswordNotMatchState(this.message);

  List<Object?> get props => [message];
}

final class ValidRegisterFormState extends AddingUsersState {
  final String userName;
  final String email;
  final String password;
  final String role;

  ValidRegisterFormState(this.email, this.password, this.userName, this.role);
}

final class RegisterLoadingState extends AddingUsersState {}

class RegisterSuccessState extends AddingUsersState {
  // final RegisteResponse user;
  //
  // RegisterSuccessStateStatee(this.user);
  //
  // @override
  // List<Object?> get props => [user];
}

class RegisterFailState extends AddingUsersState {
  final String message;

  RegisterFailState(this.message);

  List<Object?> get props => [message];
}

// navigate
class NavigateToHomeScreenState extends AddingUsersState {}

class RoleSelectedState extends AddingUsersState {
  final String role;

  RoleSelectedState(this.role);
}
