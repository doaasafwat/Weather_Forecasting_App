  import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/loginAndregister/_views/register_screen.dart';

Widget buildRegisterText(BuildContext context) {
    return Center(
      child: RichText(
        text:  TextSpan(
          text: "Don't have an account? ",
          style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
          children: [
          TextSpan(
            text: 'Register Now',
            style: const TextStyle(color: Color(0xFF6A55E0),fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to RegisterScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const RegisterScreen()),
                );
              },
          ),
        ],
      ),
    ),
  );
}