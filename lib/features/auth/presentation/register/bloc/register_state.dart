part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class PasswordMatchState extends RegisterState {}

class PasswordNotMatchState extends RegisterState {
  final String message;

  PasswordNotMatchState(this.message);

  List<Object?> get props => [message];
}

final class ValidRegisterFormState extends RegisterState {
  final String userName;
  final String email;
  final String password;

  ValidRegisterFormState(this.email, this.password, this.userName);
}

final class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  // final RegisteResponse user;
  //
  // RegisterSuccessStateStatee(this.user);
  //
  // @override
  // List<Object?> get props => [user];
}

class RegisterFailState extends RegisterState {
  final String message;

  RegisterFailState(this.message);

  List<Object?> get props => [message];
}

// navigate
class NavigateToHomeScreenState extends RegisterState {}
