  import 'package:flutter/material.dart';

Widget buildRegisterText() {
    return Center(
      child: RichText(
        text: const TextSpan(
          text: "Don't have an account? ",
          style: TextStyle(color: Colors.grey),
          children: [
            TextSpan(
              text: 'Register Now',
              style: TextStyle(color: Color(0xFF6A55E0)),
            ),
          ],
        ),
      ),
    );
  }
