import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonEvent>(_onRegisterEvent);
    on<CallFirebaseRegisterEvent>(_onCallFirebaseRegisterEvent);
    on<NavigateToHomeScreenEvent>(_onNavigateToHomeEvent);
    on<IsPasswordMatchEvent>(_onIsPasswordMatchEvent);
  }

  FutureOr<void> _onRegisterEvent(
      RegisterButtonEvent event, Emitter<RegisterState> emit) {
    emit(ValidRegisterFormState(event.email, event.password, event.userName));
  }

  //  emit(PasswordMatchState(event.password,event.confirmPassword))
  FutureOr<void> _onIsPasswordMatchEvent(
      IsPasswordMatchEvent event, Emitter<RegisterState> emit) {
    if (event.password != event.confirmPassword) {
      emit(PasswordNotMatchState("Passwords Don't Match"));
    } else {
      emit(PasswordMatchState());
    }
  }

  FutureOr<void> _onCallFirebaseRegisterEvent(
      CallFirebaseRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    try {
      // TODO : login fun ( emit state )
      UserCredential? userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.email, password: event.password);
      createUserDocument(userCredentials, event.email);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailState(e.code));
    }
  }

  FutureOr<void> _onNavigateToHomeEvent(
      NavigateToHomeScreenEvent event, Emitter<RegisterState> emit) {
    emit(NavigateToHomeScreenState());
  }

  Future<void> createUserDocument(
      UserCredential? userCredential, String? userName) async {
    if (userCredential != null && userCredential.user != null) {
      try {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.user!.uid)
            .set({
          "email": userCredential.user!.email,
          'userName': userName,
          'role': 'User'
        });
        print("User document created successfully");
      } catch (e) {
        print("Failed to create user document: $e");
      }
    }
  }
}
