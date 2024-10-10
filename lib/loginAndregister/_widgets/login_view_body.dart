import 'package:flutter/material.dart';
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

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF1D2837),
      body: SafeArea(
        child: SingleChildScrollView(
          // Add a scrollable view
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.03,
              horizontal: screenWidth * 0.04,
            ),
            child: Center(
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Set column to fit children only
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
                  buildTextField('Enter your email', false, screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField('Enter your password', true, screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                const BuildForgetPassword(),
                  SizedBox(height: screenHeight * 0.03),
                  buildButton(context, screenHeight, screenWidth, 'Login', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchView()),
                    );
                  }),
                  SizedBox(height: screenHeight * 0.03),
                  buildDividerWithText('Or Login With'),
                  SizedBox(height: screenHeight * 0.02),
                  buildSocialLoginButtons(screenWidth),
                  SizedBox(height: screenHeight * 0.08),
                  buildRegisterText(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
