part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class NavigateToHomeEvent extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
