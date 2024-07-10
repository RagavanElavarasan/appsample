import 'package:get/get.dart';

class OTPController extends GetxController {
  var otp = List<String>.filled(6, '').obs;

  void setOTPValue(int index, String value) {
    otp[index] = value;
    update();
  }

  String get completeOTP => otp.join();
}
