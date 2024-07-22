import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mackenzie_academy/core/utils/validator.dart';
import 'package:mackenzie_academy/features/auth/data/models/login_response.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
      on<NavigateHomeScreenEvent>(_onNavigateToHomeEvent);
      //
      on<ValidateEmailEvent>(_onValidateEmailEvent);
      on<ValidatePasswordEvent>(_onValidatePasswordEvent);
      on<LoginButtonEvent>(_onLoginEvent);
      on<CallApiLoginEvent>(_onCallApiLoginEvent);
      on<ValidateStoredDataEvent>(_onValidateStoredDataEvent);
    }
    );
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
    ValidationState validateState = Validator.validateName(event.userName);
    if (validateState == ValidationState.Valid) {
      emit(EmailFormatCorrectState());
    } else {
      emit(EmailEmptyFormatState(emailValidatorMessage: "LangKeys.username_is_empty"));
    }
  }

  FutureOr<void> _onValidatePasswordEvent(
      ValidatePasswordEvent event, Emitter<LoginState> emit) {
    ValidationState validateState = Validator.validatePassword(event.password);
    if (validateState == ValidationState.Valid) {
      emit(PasswordFormatCorrectState());
    } else {
      emit(PasswordEmptyFormatState(
          passwordValidatorMessage: "LangKeys.try_with_correct_username_password"));
    }
  }

  FutureOr<void> _onLoginEvent(
      LoginButtonEvent event, Emitter<LoginState> emit) async {
    // final validationsState = AuthValidationUseCase()
    //     .validateFormUseCase(event.userName, event.password);
    // if (validationsState.isNotEmpty) {
    //   for (var element in validationsState) {
    //     if (element == ValidationState.userNameEmpty) {
    //       emit(UserNameEmptyFormatState(userNameValidatorMessage: LangKeys.username_is_empty));
    //     } else if (element == ValidationState.passwordNumberEmpty) {
    //       emit(PasswordEmptyFormatState(passwordValidatorMessage: LangKeys.password_is_empty));
    //     } else if (element == ValidationState.Formatting) {
    //       emit(UserNameEmptyFormatState(userNameValidatorMessage: LangKeys.try_with_correct_username_password));
    //     }
    //   }
    // } else {
    //   emit(ValidLoginFormState(event.email, event.password));
    // }
  }

  FutureOr<void> _onCallApiLoginEvent(
      CallApiLoginEvent event, Emitter<LoginState> emit) async {
    // emit(LoginLoadingState());
    // String encoded =
    // Utilities.encodeKeyAndPasswordForHR(event.userName, event.password);
    // LoginState? loginState = await _authenticationRepo
    //     .performLogin(LoginRequest(userCredential: encoded));
    //
    // if (loginState is LoginSuccessState) {
    //   prefManager.setUsername(event.userName);
    //   prefManager.setUserPassword(event.password);
    //   emit(LoginSuccessState(loginState.user));
    // } else if (loginState is LoginFailState) {
    //   emit(LoginFailState(loginState.messageKey));
    // } else if (loginState is NetworkErrorState) {
    //   emit(NetworkErrorState(loginState.message));
    // }
  }

  FutureOr<void> _onNavigateToHomeEvent(
      NavigateHomeScreenEvent event, Emitter<LoginState> emit) {
    emit(NavigateToHomeScreenState());
  }
}

