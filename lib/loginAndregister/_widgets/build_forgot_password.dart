import 'package:flutter/material.dart';

class buildForgotPassword extends StatelessWidget {
  const buildForgotPassword({super.key, required this.textColor, this.onTap});
  final Color textColor;
  final VoidCallback ? onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: textColor, fontSize: 14),
        ),
      ),
    );
  }
}
