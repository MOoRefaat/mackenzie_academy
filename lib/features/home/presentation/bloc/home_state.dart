part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

class HomeInitial extends HomeState {}

class NavigateToNextScreenState extends HomeState {
  final String? routeName;

  NavigateToNextScreenState(this.routeName);

  @override
  List<Object?> get props => [routeName];
}

class LogoutLoadingState extends HomeState {}

class LogoutSuccessState extends HomeState {
  // final LoginResponse user;
  //
  // LoginSuccessState(this.user);
  //
  // @override
  // List<Object?> get props => [user];
}

class NetworkErrorState extends HomeState {
  final String message;

  NetworkErrorState(this.message);

  List<Object?> get props => [message];
}

class NavigateToLoginScreenState extends HomeState {}

