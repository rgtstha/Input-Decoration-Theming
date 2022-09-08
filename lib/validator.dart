class Validator {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name can not be empty";
    }

    if (value.length < 2) {
      ;
      return "Name length must be greater than 2";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password can not be empty";
    }

    if (value.length < 6) {
      return "Password length must be greater than 6 character.";
    }
    return null;
  }
}
