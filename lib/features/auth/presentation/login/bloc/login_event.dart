part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

// navigate
class NavigateToRegisterScreenEvent extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NavigateToUserHomeScreenEvent extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NavigateToAdminHomeScreenEvent extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NavigateToCoachHomeScreenEvent extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
