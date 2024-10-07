import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_back_botton.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_divider_with_text.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_login_button.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_login_text.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_social_login_buttons.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_text_field.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/register_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  buildBackButton(),
                  SizedBox(height: screenHeight * 0.05),
                  RegisterText(screenWidth: screenWidth),
                  SizedBox(height: screenHeight * 0.03),
                  buildTextField('Username', false, screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField('Email', false, screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField('Password', true, screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField('Confirm Password', true, screenHeight),
                  SizedBox(height: screenHeight * 0.03),
                  buildButton(screenHeight, screenWidth, 'Register'),
                  SizedBox(height: screenHeight * 0.03),
                  buildDividerWithText('Or Register with'),
                  SizedBox(height: screenHeight * 0.02),
                  buildSocialLoginButtons(screenWidth),
                  SizedBox(height: screenHeight * 0.08),
                  buildLoginText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton(double screenHeight, double screenWidth) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.07,
        decoration: BoxDecoration(
          color: const Color(0xFF8353FF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'Register',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenHeight * 0.025,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
