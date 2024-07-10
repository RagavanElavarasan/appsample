import 'package:app_sample/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:app_sample/forget_password_controller.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordController controller =
        Get.put(ForgetPasswordController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          'My Trading Council',
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
                Text(
                  'Back',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 190),
              child: Center(
                child: Text(
                  'Forget Password ?',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: Text(
                'It is a long established fact that a reader will be distracted by the readable content',
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: controller.mobileNumberController,
                keyboardType: TextInputType.number, // Show numeric keypad
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter
                      .digitsOnly, // Allow only numeric input
                ],
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline, color: Colors.blue),
                  labelText: 'Mobile Number',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: 380,
              child: Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Obx(() => ElevatedButton(
                      onPressed: controller.isValidMobileNumber.value
                          ? () {
                              Get.to(() => OTPVerificationPage());
                            }
                          : null,
                      child: Text(
                        'Send OTP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.isValidMobileNumber.value
                            ? Color.fromARGB(255, 41, 98, 255)
                            : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
