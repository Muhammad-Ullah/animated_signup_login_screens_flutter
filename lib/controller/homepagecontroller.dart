import 'package:get/get.dart';

class HomePageController extends GetxController {

  final strength=0.0.obs;
  final email=" ".obs;
  final password=" ".obs;
  final fName = " ".obs;

  validateEmail(String val) {
    if (val.isValidEmail) {
      email.value = "";
    } else {
      email.value = 'Please enter a valid Email';
    }
  }
   validatePassword(String val) {
    if (val.isValidPassword) {
      password.value = "";
    } else {
      password.value = '1 Upper case,1 lowercase,1 Number,1 Character and 8+ length';
    }
  }
  validateFName(String val) {
    if (val.isNotEmpty && val.length>4) {
      fName.value = "";
    } else {
      fName.value =  'Name should be 4+ characters';
    }
  }
  void checkPassword(String value) {
    if (value.isEmpty) {
        strength.value = 0;
    } else if (value.length < 6) {
        strength.value = 1 / 4;
    } else if (value.length < 8) {
        strength.value = 2 / 4;
    } else {
      if (!RegExp(r".*[A-Za-z].*").hasMatch(value) || !RegExp(r".*[0-9].*").hasMatch(value)) {
          strength.value = 3 / 4;
      } else {
          strength.value = 1;
      }
    }
  }

  bool get validate {
    if (email.value!=" " &&
        password.value!=" " &&
       fName.value!=" ") {
      return true;
    } else {
      return false;
    }
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
    RegExp(r'[0-9]');
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isGoodPassword {
    final passwordRegExp = RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }
  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}