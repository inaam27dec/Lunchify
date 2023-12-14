import 'package:email_validator/email_validator.dart';

import 'constants.dart';

class Validators {
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name can\'t be Empty';
    }
    if (name.contains(' ')) {
      return 'Name can\'t have White Spaces';
    }
    if (name.contains(RegExp(r'[0-9]'))) {
      return 'Name can\'t have Numbers';
    }
    if (name.length > 25) {
      return 'Name can\'t have greater than 25 letters';
    }
    return null;
  }

  static String? validatePhone(String? phone) {
    String pattern = r'(^(?:[+92,03])?[0-9]{11,13}$)';
    if (phone == null || phone.isEmpty) {
      return 'Phone Number can\'t be Empty';
    }
    if (!RegExp(pattern).hasMatch(phone)) {
      return 'Please Enter a Valid Phone Number';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password can\'t be Empty';
    }
    if (password.length < 6) {
      return ValidatorConstants.passwordLengthError;
    }
    return null;
  }

  static String? validateAddress(String? address) {
    if (address == null || address.isEmpty) {
      return 'Address can\'t be Empty';
    }
    if (address.length < 5) {
      return 'Address can\'t be this Short';
    }
    if (address.length > 256) {
      return 'Address can\'t be this Large';
    }
    return null;
  }

  static bool validateSignupPassword(String? password, String? otherPassword) {
    if (password != null) {
      if (password.length < 6) {
        return false;
      } else if (password == otherPassword) {
        return true;
      } else {
        return false;
      }
    }

    return false;
  }

  static bool validateEmail(String? email) {
    if (email == null) {
      return false;
    }

    return EmailValidator.validate(email, true, true);
  }
}
