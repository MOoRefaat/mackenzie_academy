part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

// navigate
class NavigateToRegisterScreenState extends LoginState {}

class NavigateToHomeScreenState extends LoginState {}
// class NavigateToUserHomeScreenState extends LoginState {}
//
// class NavigateToAdminHomeScreenState extends LoginState {}
//
// class NavigateToCoachHomeScreenState extends LoginState {}