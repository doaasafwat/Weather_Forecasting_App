import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/loginAndregister/_views/login_screen.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_back_botton.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_divider_with_text.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_login_button.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_login_text.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_social_login_buttons.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_text_field.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/register_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Initialize Firebase Authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Controllers for TextFields
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  String statusMessage = '';

  Future<void> registerUser() async {
    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        statusMessage = "Passwords do not match";
      });
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        statusMessage = e.message ?? "Registration failed. Try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF1D2837),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.03,
              horizontal: screenWidth * 0.04,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildBackButton(context, onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                    );
                  }),
                  SizedBox(height: screenHeight * 0.05),
                  RegisterText(screenWidth: screenWidth),
                  SizedBox(height: screenHeight * 0.03),
                  buildTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    isPassword: false,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(
                    controller: emailController,
                    hintText: 'Email',
                    isPassword: false,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    isPassword: true,
                    screenHeight: screenHeight,
                    isPasswordVisible: isPasswordVisible,
                    onTogglePasswordVisibility: () {
                      setState(() {
                        isPasswordVisible =
                            !isPasswordVisible; // Toggle visibility
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    isPassword: true,
                    screenHeight: screenHeight,
                     isPasswordVisible: isPasswordVisible,
                    onTogglePasswordVisibility: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible; // Toggle visibility
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  buildButton(
                    context,
                    screenHeight,
                    screenWidth,
                    'Register',
                    () {
                      registerUser(); // Call the registration function
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  buildDividerWithText('Or Register with'),
                  SizedBox(height: screenHeight * 0.02),
                  buildSocialLoginButtons(screenWidth),
                  SizedBox(height: screenHeight * 0.05),
                  buildLoginText(context),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    statusMessage,
                    style: const TextStyle(color: Colors.redAccent),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
