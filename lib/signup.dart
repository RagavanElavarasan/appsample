import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_sample/login.dart';
import 'package:app_sample/signup_controller.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text('My Trading Council',
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
                Text(
                  'Back',
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 30,
                    color: const Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          child: TextField(
                            controller: controller.firstNameController,
                            decoration: InputDecoration(
                              labelText: 'First Name',
                              hintText: 'First Name',
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 50,
                          child: TextField(
                            controller: controller.lastNameController,
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              hintText: 'Last Name',
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    child: TextField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email ID',
                        hintText: 'Email ID',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    child: TextField(
                      controller: controller.passwordController,
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    child: TextField(
                      controller: controller.mobileNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        hintText: 'Mobile Number',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    child: TextField(
                      controller: controller.educationController,
                      decoration: InputDecoration(
                        labelText: 'Education Qualification',
                        hintText: 'Education Qualification',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    child: TextField(
                      controller: controller.dobController,
                      readOnly: true,
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          controller.selectedDate.value = picked;
                          controller.dobController.text =
                              '${picked.day}/${picked.month}/${picked.year}';
                          controller.isValidDOB.value =
                              true; // Update validation state
                          controller.validateForm(); // Validate entire form
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Date Of Birth',
                        hintText: 'Date Of Birth',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.white),
                        suffixIcon:
                            Icon(Icons.calendar_today, color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    child: TextField(
                      controller: controller.locationController,
                      decoration: InputDecoration(
                        labelText: 'Location',
                        hintText: 'Location',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(Icons.location_on_outlined,
                            color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    child: DropdownButtonFormField<String>(
                      value:
                          controller.tradingExperienceController.text.isNotEmpty
                              ? controller.tradingExperienceController.text
                              : null,
                      decoration: InputDecoration(
                        labelText: 'Trading Experience',
                        hintText: 'Trading Experience',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: '1',
                          child: Text('1 Year',
                              style: TextStyle(color: Colors.black)),
                        ),
                        DropdownMenuItem(
                          value: '2',
                          child: Text('2 Years',
                              style: TextStyle(color: Colors.black)),
                        ),
                        DropdownMenuItem(
                          value: '3',
                          child: Text('3 Years',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                      onChanged: (value) {
                        controller.tradingExperienceController.text = value!;
                        controller.validateForm();
                      },
                      style: TextStyle(
                          color:
                              Colors.white), // Text color of the selected item
                      dropdownColor: Colors.white, // Dropdown background color
                    ),
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => SizedBox(
                        width: 380,
                        child: ElevatedButton(
                          onPressed: controller.isFormValid.value
                              ? () {
                                  Get.to(() => LoginPage());
                                }
                              : null,
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.isFormValid.value
                                ? Color.fromARGB(255, 41, 98, 255)
                                : Colors.grey,
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        )),
                  ),
                  Row(
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => LoginPage());
                          },
                          child: Text(
                            'Login',
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
          ],
        ),
      ),
    );
  }
}
