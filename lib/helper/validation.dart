import 'package:get/get.dart';

extension Validator on String {
  String? get validateEmail {
    if (!GetUtils.isEmail(trim())) {
      return "Invalid Email Address";
    } else {
      return null;
    }
  }

  String? get validatePhoneNumber {
    if (length > 15 || length < 9) {
      return Get.context != null
          ? "Invalid Phone Number"
          : "Provide valid phone number";
    }

    if (!GetUtils.isPhoneNumber(trim())) {
      return Get.context != null
          ? "Invalid Phone Number"
          : "Provide valid phone number";
    }
    // if (startsWith("9")) {
    //   return null;
    // } else if (startsWith("7")) {
    //   return null;
    // } else {
    //   return Get.context != null
    //       ? "Invalid Phone Number"
    //       : "Provide valid phone number";
    // }
  }

  String? get validatePassword {
    if (!GetUtils.isLengthGreaterOrEqual(this, 8)) {
      return "Invalid Password";
    } else {
      return null;
    }
  }

  String? validatePasswordMatch(password) {
    if (this != password) {
      return "Both password must match";
    } else {
      return null;
    }
  }

  // String? validateField({required String fieldName}) {
  //   final errorMessage = "can't be empty";
  //   if (isEmpty) {
  //     return Utils.concatenateString([fieldName, errorMessage]);
  //   }
  //   return null;
  // }
}
