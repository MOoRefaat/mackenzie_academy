part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

// navigate
class NavigateToRegisterScreenEvent extends RegisterEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NavigateToHomeScreenEvent extends RegisterEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
