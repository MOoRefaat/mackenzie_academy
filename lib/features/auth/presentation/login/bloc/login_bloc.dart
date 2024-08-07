import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mackenzie_academy/core/shared_preference/shared_preference_manager.dart';
import 'package:mackenzie_academy/core/utils/validator.dart';
import 'package:mackenzie_academy/features/auth/data/models/login_request.dart';
import 'package:mackenzie_academy/features/auth/data/models/login_response.dart';
import 'package:mackenzie_academy/features/auth/domain/usecases/auth_validation_usecase.dart';
import 'package:mackenzie_academy/features/auth/domain/usecases/remote/post_login.dart';
import 'package:mackenzie_academy/features/home/data/models/users_services.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PostLoginByEmailUseCase _postLoginByEmailUseCase;
  final SharedPreferenceManager sharedPreferenceManager;

  LoginBloc(this._postLoginByEmailUseCase, this.sharedPreferenceManager)
      : super(LoginInitial()) {
    // on<ValidateEmailEvent>(_onValidateEmailEvent);
    // on<ValidatePasswordEvent>(_onValidatePasswordEvent);
    on<LoginButtonEvent>(_onLoginEvent);
    on<CallFirebaseLoginEvent>(_onCallFirebaseLoginEvent);
    on<ValidateStoredDataEvent>(_onValidateStoredDataEvent);
    on<NavigateHomeScreenEvent>(_onNavigateToHomeEvent);
    on<NavigateToRegisterScreenEvent>(_onNavigateToRegisterEvent);
  }

  FutureOr<void> _onValidateStoredDataEvent(
      ValidateStoredDataEvent event, Emitter<LoginState> emit) async {
    // String? name = await prefManager.getUsername();
    // String? password = await prefManager.getUserPassword();
    // if (name != null &&
    //     name.isNotEmpty &&
    //     password != null &&
    //     password.isNotEmpty) {
    //   emit(ValidLoginFormState(name, password));
    // }
  }

  FutureOr<void> _onValidateEmailEvent(
      ValidateEmailEvent event, Emitter<LoginState> emit) {
    ValidationState validateState = Validator.validateEmail(event.email);
    if (validateState == ValidationState.Valid) {
      emit(EmailFormatCorrectState());
    } else {
      emit(EmailEmptyFormatState(
          emailValidatorMessage: "LangKeys.username_is_empty"));
    }
  }

  FutureOr<void> _onValidatePasswordEvent(
      ValidatePasswordEvent event, Emitter<LoginState> emit) {
    ValidationState validateState = Validator.validatePassword(event.password);
    if (validateState == ValidationState.Valid) {
      emit(PasswordFormatCorrectState());
    } else {
      emit(PasswordEmptyFormatState(
          passwordValidatorMessage:
              "LangKeys.try_with_correct_username_password"));
    }
  }

  FutureOr<void> _onLoginEvent(
      LoginButtonEvent event, Emitter<LoginState> emit) async {
    // final validationsState = AuthValidationUseCase()
    //     .validateFormUseCase(event.email, event.password);
    // if (validationsState.isNotEmpty) {
    //   for (var element in validationsState) {
    //     if (element == ValidationState.userNameEmpty) {
    //       emit(EmailEmptyFormatState(emailValidatorMessage: "email_is_empty"));
    //     } else if (element == ValidationState.passwordNumberEmpty) {
    //       emit(PasswordEmptyFormatState(
    //           passwordValidatorMessage: "password_is_empty"));
    //     } else if (element == ValidationState.Formatting) {
    //       emit(EmailEmptyFormatState(
    //           emailValidatorMessage: "try_with_correct_username_password"));
    //     }
    //   }
    // } else {
    emit(ValidLoginFormState(event.email, event.password));
    // }
  }

  FutureOr<void> _onCallFirebaseLoginEvent(
      CallFirebaseLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try {
      UserCredential? userCredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: event.email, password: event.password);
      final userType = getUserStream(userCredentials.user!.uid);
      await for (var userDoc in userType) {
        if (userDoc.exists) {
          final Map<String, dynamic> userData =
              userDoc.data() as Map<String, dynamic>;
          final String role = userData['role'];
          print("User role: $role");
          emit(LoginSuccessState(role));
        } else {
          print("userDoc no");
        }
      }
    } on FirebaseAuthException catch (e) {
      emit(NetworkErrorState(e.code));
    }
  }

  FutureOr<void> _onNavigateToHomeEvent(
      NavigateHomeScreenEvent event, Emitter<LoginState> emit) {
    emit(NavigateToHomeScreenState(event.userType));
  }

  FutureOr<void> _onNavigateToRegisterEvent(
      NavigateToRegisterScreenEvent event, Emitter<LoginState> emit) {
    emit(NavigateToRegisterScreenState());
  }

  Stream<DocumentSnapshot> getUserStream(String uid) {
    return FirebaseFirestore.instance.collection('Users').doc(uid).snapshots();
  }

  Future<DocumentSnapshot> getUser(String uid) {
    return FirebaseFirestore.instance.collection('Users').doc(uid).get();
  }
}
