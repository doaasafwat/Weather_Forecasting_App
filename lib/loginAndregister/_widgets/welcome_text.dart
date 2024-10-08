import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  final double screenWidth;
  const WelcomeText({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Welcome back! Glad\nto see you, Again!',
        style: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.07,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
