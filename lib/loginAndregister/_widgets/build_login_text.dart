 import 'package:flutter/material.dart';

Widget buildLoginText() {
    return Center(
      child: RichText(
        text: const TextSpan(
          text: "Already have an account? ",
          style: TextStyle(color: Colors.grey),
          children: [
            TextSpan(
              text: 'Login Now',
              style: TextStyle(color: Color(0xFF6A55E0)),
            ),
          ],
        ),
      ),
    );
  }
