import 'package:app_sample/login.dart';
import 'package:app_sample/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(
          builder: (context) {
            final mediaQuery = MediaQuery.of(context);
            final height = mediaQuery.size.height;
            final width = mediaQuery.size.width;

            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/index.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: height * 0.25),
                        child: Text(
                          '"Remember that the stock market is a manic depressive"',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.05, // responsive font size
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.05),
                    child: Column(
                      children: [
                        SizedBox(
                          width: width * 0.85, // responsive width
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => LoginPage());
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.045, // responsive font size
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 41, 98, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.015), // responsive spacing
                        SizedBox(
                          width: width * 0.85, // responsive width
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => SignupPage());
                            },
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.045, // responsive font size
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 41, 98, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.09), // responsive spacing
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
