import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/loginAndregister/_views/login_screen.dart';
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
                  buildBackButton(context, onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  }),
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
                  buildButton(context, screenHeight, screenWidth, 'Register',
                  (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginView()),
                      );
                  }
                  
                  
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  buildDividerWithText('Or Register with'),
                  SizedBox(height: screenHeight * 0.02),
                  buildSocialLoginButtons(screenWidth),
                  SizedBox(height: screenHeight * 0.05),
                  buildLoginText(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
