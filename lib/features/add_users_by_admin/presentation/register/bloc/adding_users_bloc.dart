import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'adding_users_event.dart';

part 'adding_users_state.dart';

class AddingUsersBloc extends Bloc<AddingUsersEvent, AddingUsersState> {
  String _selectedRole = 'User';

  AddingUsersBloc() : super(RegisterInitial()) {
    on<RegisterButtonEvent>(_onRegisterEvent);
    on<CallFirebaseRegisterEvent>(_onCallFirebaseRegisterEvent);
    on<NavigateToHomeScreenEvent>(_onNavigateToHomeEvent);
    on<IsPasswordMatchEvent>(_onIsPasswordMatchEvent);
    on<RoleSelectedEvent>(_onRoleSelectedEvent);
  }
  FutureOr<void> _onRegisterEvent(
      RegisterButtonEvent event, Emitter<AddingUsersState> emit) {
    emit(ValidRegisterFormState(event.email, event.password, event.userName,event.role));
    add(CallFirebaseRegisterEvent(
      email: event.email,
      password: event.password,
      userName: event.userName,
      role: _selectedRole,
    ));
  }

  FutureOr<void> _onIsPasswordMatchEvent(
      IsPasswordMatchEvent event, Emitter<AddingUsersState> emit) {
    if (event.password != event.confirmPassword) {
      emit(PasswordNotMatchState("Passwords Don't Match"));
    } else {
      emit(PasswordMatchState());
    }
  }

  FutureOr<void> _onCallFirebaseRegisterEvent(
      CallFirebaseRegisterEvent event, Emitter<AddingUsersState> emit) async {
    emit(RegisterLoadingState());
    try {
      // TODO : login fun ( emit state )
      UserCredential? userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.email, password: event.password);
      emit(RegisterSuccessState());
      createUserDocument(userCredentials, event.userName,event.role);
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailState(e.code));
    }
  }

  FutureOr<void> _onNavigateToHomeEvent(
      NavigateToHomeScreenEvent event, Emitter<AddingUsersState> emit) {
    emit(NavigateToHomeScreenState());
  }

  Future<void> createUserDocument(
      UserCredential? userCredential, String? userName,String? role) async {
    if (userCredential != null && userCredential.user != null) {
      try {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.user!.uid)
            .set({
          "email": userCredential.user!.email,
          'userName': userName,
          'role': role
        });
        print("User document created successfully");
      } catch (e) {
        print("Failed to create user document: $e");
      }
    }
  }
    FutureOr<void> _onRoleSelectedEvent(
        RoleSelectedEvent event, Emitter<AddingUsersState> emit) {
      _selectedRole = event.role;
      emit(RoleSelectedState(event.role));
    }

}
