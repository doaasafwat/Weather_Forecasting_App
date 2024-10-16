import 'package:cloud_firestore/cloud_firestore.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  String statusMessage = '';

  Future<void> registerUser() async {
    if (usernameController.text.isEmpty) {
      setState(() {
        // statusMessage = "Username is required";
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Username is required')),
      );
      });
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        // statusMessage = "Passwords do not match";
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Passwords do not match')),
      );
      });
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      String uid = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'username': usernameController.text,
        'email': emailController.text,
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()),
        );
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        // statusMessage = e.message ?? "Registration failed. Try again.";
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(e.message ?? "Registration failed. Try again.")),
      );
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
                  BuildTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    isPassword: false,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  BuildTextField(
                    controller: emailController,
                    hintText: 'Email',
                    isPassword: false,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  BuildTextField(
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
                  BuildTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    isPassword: true,
                    screenHeight: screenHeight,
                    isPasswordVisible: isConfirmPasswordVisible,
                    onTogglePasswordVisibility: () {
                      setState(() {
                        isConfirmPasswordVisible =
                            !isConfirmPasswordVisible; // Toggle visibility
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
                  // Text(
                  //   statusMessage,
                  //   style: const TextStyle(color: Colors.redAccent),
                  //   textAlign: TextAlign.center,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
