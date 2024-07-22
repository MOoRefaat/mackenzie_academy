import 'package:mackenzie_academy/core/utils/validator.dart';

class AuthValidationUseCase {
  List<ValidationState> validateFormUseCase(String username, String password) {
    List<ValidationState> validations = List.empty(growable: true);
    ValidationState validation;
    validation = validateUserName(username);
    if (validation != ValidationState.Valid) {
      validations.add(validation);
    }
    validation = validatePassword(password);
    if (validation != ValidationState.Valid) {
      validations.add(validation);
    }
    return validations;
  }

  ValidationState validateUserName(String userName) {
    return Validator.validateName(userName);
  }

  ValidationState validatePassword(String password) {
    return Validator.validatePassword(password);
  }
}