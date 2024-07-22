class Validator {
  static bool isName(String name) {
    const String pattern = r'^[a-zA-Z0-9_.]+$';
    var regExp = RegExp(pattern);
    return regExp.hasMatch(name.trim());
  }

  static ValidationState validateName(String name) {
    if (name.isNullOrEmpty) {
      return ValidationState.userNameEmpty;
    } else if (!isName(name)) {
      return ValidationState.Formatting;
    } else {
      return ValidationState.Valid;
    }
  }

  static ValidationState validatePassword(String password) {
    if (password.isNullOrEmpty) {
      return ValidationState.passwordNumberEmpty;
    } else if (password.length < 8) {
      return ValidationState.Formatting;
    } else {
      return ValidationState.Valid;
    }
  }

  static bool isEmail(String email) {
    const String pattern =
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
    var regExp = RegExp(pattern);
    return regExp.hasMatch(email.trim());
  }

  static ValidationState validateEmail(String email) {
    if (email.isNullOrEmpty) {
      return ValidationState.emailEmpty;
    } else if (!isEmail(email)) {
      return ValidationState.Formatting;
    } else {
      return ValidationState.Valid;
    }
  }
}

enum ValidationState {
  Formatting,
  Valid,
  userNameEmpty,
  passwordNumberEmpty,
  emailEmpty,
}

extension Validation on String {
  bool get isNullOrEmpty => (this != null && this.isNotEmpty) ? false : true;
}
