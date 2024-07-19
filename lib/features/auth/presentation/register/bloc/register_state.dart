part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class LoginInitial extends RegisterState {}

class NavigateToHomeState extends RegisterState {}