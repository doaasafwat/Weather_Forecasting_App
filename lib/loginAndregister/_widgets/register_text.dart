import 'package:flutter/material.dart';

class RegisterText extends StatelessWidget {
   final double screenWidth;
  const RegisterText({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Hello! Register to get\nstarted',
        style: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.07,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
