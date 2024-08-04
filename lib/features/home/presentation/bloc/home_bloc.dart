import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<NavigateToNextScreenEvent>(_onNavigateToNextEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<NavigateToLoginScreenEvent>(_onNavigateToLoginScreenEvent);
  }
}

FutureOr<void> _onNavigateToNextEvent(
    NavigateToNextScreenEvent event, Emitter<HomeState> emit) {
  emit(NavigateToNextScreenState(event.routeName));
}

FutureOr<void> _onLogoutEvent(
    LogoutEvent event, Emitter<HomeState> emit) async {
  emit(LogoutLoadingState());
  try {
    FirebaseAuth.instance.signOut();
    emit(LogoutSuccessState());
  } on FirebaseAuthException catch (e) {
    emit(NetworkErrorState(e.code));
  }
}

FutureOr<void> _onNavigateToLoginScreenEvent(
    NavigateToLoginScreenEvent event, Emitter<HomeState> emit) {
  emit(NavigateToLoginScreenState());
}
