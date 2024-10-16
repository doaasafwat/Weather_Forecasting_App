import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_back_botton.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_divider_with_text.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_forgot_password.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_login_button.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_register_text.button.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_social_login_buttons.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_text_field.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/welcome_text.dart';

import 'package:weather_forecasting_app/views/search_view.dart';

import 'package:weather_forecasting_app/views/splash_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String statusMessage = '';
  bool isPasswordVisible = false;

  Future<void> loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SearchView()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'wrong-password') {
          // statusMessage = 'The password you entered is incorrect.';
           ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('The password you entered is incorrect.')),
      );
        } else if (e.code == 'user-not-found') {
          // statusMessage = 'Email or password is incorrect.';
           ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Email or password is incorrect.')),
      );

        } else if (e.code == 'invalid-email') {
          // statusMessage = 'Please enter valid email address.';
           ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter valid email address.')),
      );
        } else if (e.code == 'invalid-credential') {
          // statusMessage = 'Email or password is incorrect.';
           ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Email or password is incorrect.')),
      );
        } else {
          // statusMessage = 'Login failed. Please try again.';
           ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Login failed. Please try again.')),
      );
        }
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
                            builder: (context) => const SplashView()));
                  }),
                  SizedBox(height: screenHeight * 0.05),
                  WelcomeText(screenWidth: screenWidth),
                  SizedBox(height: screenHeight * 0.03),
                  BuildTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    isPassword: false,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  BuildTextField(
                    controller: passwordController,
                    hintText: 'Enter your password',
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

                  SizedBox(height: screenHeight * 0.03),

                  const BuildForgotPassword(),
                  SizedBox(height: screenHeight * 0.03),
                  buildButton(
                    context,
                    screenHeight,
                    screenWidth,
                    'Login',
                    loginUser,
                  ),

                  SizedBox(height: screenHeight * 0.03),
                  buildDividerWithText('Or Login With'),
                  SizedBox(height: screenHeight * 0.02),
                  buildSocialLoginButtons(screenWidth),
                  SizedBox(height: screenHeight * 0.08),
                  buildRegisterText(context),
                  SizedBox(height: screenHeight * 0.02),
                  // Display login error or status message
                  // if (statusMessage.isNotEmpty)
                  //   Text(
                  //     statusMessage,
                  //     style: const TextStyle(color: Colors.redAccent),
                  //     textAlign: TextAlign.center,
                  //   ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
