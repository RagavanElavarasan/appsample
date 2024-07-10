import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final mobileNumberController = TextEditingController();
  var mobileNumber = ''.obs;
  var isValidMobileNumber = false.obs;

  @override
  void onInit() {
    super.onInit();
    mobileNumberController.addListener(() {
      mobileNumber.value = mobileNumberController.text;
      validateMobileNumber();
    });
  }

  void validateMobileNumber() {
    // Check if the mobile number has exactly 10 digits
    if (mobileNumber.value.length == 10) {
      isValidMobileNumber.value = true;
    } else {
      isValidMobileNumber.value = false;
    }
  }

  @override
  void onClose() {
    mobileNumberController.dispose();
    super.onClose();
  }
}
