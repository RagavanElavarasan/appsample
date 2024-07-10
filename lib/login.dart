import 'package:app_sample/forgetpassword.dart';
import 'package:app_sample/signup.dart';
import 'package:app_sample/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = Get.put(LoginController());
  bool _isObscure = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 320,
              width: 700,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: loginController.mobileNumberController,
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
            SizedBox(height: 12),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: loginController.passwordController,
                style: TextStyle(color: Colors.white),
                obscureText: _isObscure,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.blue),
                  suffixIcon: IconButton(
                    onPressed: _togglePasswordVisibility,
                    icon: Icon(
                      _isObscure ? MdiIcons.eye : MdiIcons.eyeOff,
                      color: Colors.white,
                    ),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'hint text',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: TextButton(
                    onPressed: () {
                      Get.to(() => ForgetPasswordPage());
                    },
                    child: Text(
                      'Forget password?',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 2),
                    ))),
            SizedBox(
              width: 380,
              child: Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(() => ElevatedButton(
                        onPressed: loginController.isValidMobileNumber.value &&
                                loginController.isValidPassword.value
                            ? () {
                                loginController.login();
                              }
                            : null,
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              loginController.isValidMobileNumber.value &&
                                      loginController.isValidPassword.value
                                  ? Color.fromARGB(255, 41, 98, 255)
                                  : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ))),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 22)),
                Text(
                  "Don't have an account ? ",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => SignupPage());
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 2),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
