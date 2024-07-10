import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();

  var mobileNumber = ''.obs;
  var password = ''.obs;
  var isValidMobileNumber = false.obs;
  var isValidPassword = false.obs;

  @override
  void onInit() {
    super.onInit();
    mobileNumberController.addListener(() {
      mobileNumber.value = mobileNumberController.text;
      validateMobileNumber();
    });

    passwordController.addListener(() {
      password.value = passwordController.text;
      validatePassword();
    });
  }

  void validateMobileNumber() {
    if (mobileNumber.value.length == 10) {
      isValidMobileNumber.value = true;
    } else {
      isValidMobileNumber.value = false;
    }
  }

  void validatePassword() {
    final passwordValue = password.value;

    // Regular expression to check the password constraints
    final regex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    // Check if the password meets the criteria
    if (regex.hasMatch(passwordValue)) {
      isValidPassword.value = true;
    } else {
      isValidPassword.value = false;
    }
  }

  void login() {
    if (isValidMobileNumber.value && isValidPassword.value) {
      // Implement login logic
      Get.snackbar('Success', 'Login Successful');
    } else {
      Get.snackbar('Error', 'Invalid mobile number or password');
    }
  }

  @override
  void onClose() {
    mobileNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
