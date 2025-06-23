import 'package:htca_app/constants/exports.dart';

class Validaters {
  static const int minPasswordLength = 8;
  static final RegExp passwordSpChRegExp = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[@\$!%*#?~(&)+=^_\-/.,;]).{8,}$',
  );
  static final RegExp passwordRegExp = RegExp(
    r'^(?=.*[A-Z])(?=.*\d).{8,}$',
  );

  //
  // (?=.*\d)          // should contain at least one digit
  // (?=.*[a-z])       // should contain at least one lower case
  // (?=.*[A-Z])       // should contain at least one upper case
  // [a-zA-Z0-9]{8,}   // should contain at least 8 from the mentioned characters
  //

  static String? validateName(String? text) {
    if (text == null || text.trim().isEmpty == true) {
      return "${AppStrings.pleaseEnter} ${AppStrings.name.toLowerCase()}";
    } else {
      return null;
    }
  }

  static String? validateEmail(String? text) {
    if (text == null || text.trim().isEmpty == true) {
      return "${AppStrings.pleaseEnter} ${AppStrings.email.toLowerCase()}";
    } else if (!GetUtils.isEmail(text)) {
      return AppStrings.enterValidEmail;
    }
    return null;
  }

  static String? validatePassword(String? text,
      {String? errorText, bool isNewPass = false}) {
    if (text == null || text.trim().isEmpty == true) {
      return "${AppStrings.pleaseEnter} ${isNewPass ? AppStrings.newText.toLowerCase() : ''} ${AppStrings.password.toLowerCase()}";
      // } else if (GetUtils.isLengthLessThan(text, minPasswordLength)) {
      //   return 'Should be at least 8 characters';
    } else if (!passwordRegExp.hasMatch(text)) {
      return (errorText ?? AppStrings.passwordMust8Char1UpperCase1Number);
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? confirmPass, String? password) {
    if (confirmPass == null || confirmPass.trim().isEmpty == true) {
      return "${AppStrings.pleaseEnter} ${AppStrings.confirmPassword.toLowerCase()}";
    } else if (confirmPass != password) {
      return AppStrings.confirmPasswordNotMatched;
    }
    return null;
  }

  static String? validatePinCode({String? text, String? message, int? length}) {
    String? value = text?.trim();

    if (value == null || value.isEmpty == true) {
      return (message ?? AppStrings.pleaseEnterPinCode);
    } else if (length != null && length != value.length) {
      return AppStrings.pleaseEnterCompleteCode;
    }
    return null;
  }

  static String? validateNumber(
    String? text,
  ) {
    String? value = text?.trim();

    if (value == null || value.isEmpty) {
      return AppStrings.pleaseEnterANumber;
    }
    if (double.tryParse(value) == null) {
      return AppStrings.pleaseEnterAValidNumber;
    }
    return null;
  }

  static String? validateOptionalNumber(
    String? text,
  ) {
    String? value = text?.trim();

    if (value != null && value.isNotEmpty && double.tryParse(value) == null) {
      return AppStrings.pleaseEnterAValidNumber;
    }
    return null;
  }

  static String? validateData(String? text) {
    if (text == null || text.trim().isEmpty == true) {
      return AppStrings.pleaseEnterValidData;
    } else {
      return null;
    }
  }

  static String? noValidation(String? text) {
    return null;
  }
}
