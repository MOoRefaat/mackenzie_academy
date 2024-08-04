part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


class NavigateToNextScreenEvent extends HomeEvent {
  final String? routeName;

  NavigateToNextScreenEvent(this.routeName);

  @override
  List<Object?> get props => [routeName];
}

class LogoutEvent extends HomeEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NavigateToLoginScreenEvent extends HomeEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}


