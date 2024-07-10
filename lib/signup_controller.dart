import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final educationController = TextEditingController();
  final dobController = TextEditingController();
  final locationController = TextEditingController();
  final tradingExperienceController = TextEditingController();

  var isValidFirstName = false.obs;
  var isValidLastName = false.obs;
  var isValidEmail = false.obs;
  var isValidPassword = false.obs;
  var isValidMobileNumber = false.obs;
  var isValidEducation = false.obs;
  var isValidDOB = false.obs;
  var isValidLocation = false.obs;
  var isValidTradingExperience = false.obs;
  var isFormValid = false.obs;

  var selectedDate = DateTime.now().obs; // New observable for selected date

  @override
  void onInit() {
    super.onInit();
    firstNameController.addListener(() {
      isValidFirstName.value = firstNameController.text.isNotEmpty;
      validateForm();
    });
    lastNameController.addListener(() {
      isValidLastName.value = lastNameController.text.isNotEmpty;
      validateForm();
    });
    emailController.addListener(() {
      isValidEmail.value = emailController.text.isNotEmpty &&
          GetUtils.isEmail(emailController.text);
      validateForm();
    });
    passwordController.addListener(() {
      isValidPassword.value = validatePassword(passwordController.text);
      validateForm();
    });
    mobileNumberController.addListener(() {
      isValidMobileNumber.value =
          validateMobileNumber(mobileNumberController.text);
      validateForm();
    });
    educationController.addListener(() {
      isValidEducation.value = educationController.text.isNotEmpty;
      validateForm();
    });
    dobController.addListener(() {
      isValidDOB.value = dobController.text.isNotEmpty;
      validateForm();
    });
    locationController.addListener(() {
      isValidLocation.value = locationController.text.isNotEmpty;
      validateForm();
    });
    tradingExperienceController.addListener(() {
      isValidTradingExperience.value =
          tradingExperienceController.text.isNotEmpty;
      validateForm();
    });
  }

  bool validatePassword(String password) {
    return password.length >= 8 &&
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[0-9]')) &&
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  bool validateMobileNumber(String mobileNumber) {
    return mobileNumber.length == 10 &&
        RegExp(r'^[0-9]+$').hasMatch(mobileNumber);
  }

  void validateForm() {
    isFormValid.value = isValidFirstName.value &&
        isValidLastName.value &&
        isValidEmail.value &&
        isValidPassword.value &&
        isValidMobileNumber.value &&
        isValidEducation.value &&
        isValidDOB.value &&
        isValidLocation.value &&
        isValidTradingExperience.value;
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    mobileNumberController.dispose();
    educationController.dispose();
    dobController.dispose();
    locationController.dispose();
    tradingExperienceController.dispose();
    super.onClose();
  }
}
