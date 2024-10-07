 import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/loginAndregister/_views/login_screen.dart';

Widget buildLoginText(BuildContext context) {
    return Center(
      child: RichText(
        text:  TextSpan(
          text: "Already have an account? ",
          style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
          children: [
            TextSpan(
            text: 'Login',
            style: const TextStyle(color: Color(0xFF6A55E0),fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to RegisterScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
          ),
        ],
      ),
    ),
  );
}