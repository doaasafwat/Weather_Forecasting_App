import 'package:flutter/material.dart';

Widget buildButton(double screenHeight, double screenWidth, String label) {
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
          label,
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
