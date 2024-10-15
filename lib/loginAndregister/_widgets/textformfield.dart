import 'package:flutter/material.dart';

class Textformfield extends StatelessWidget {
  const Textformfield({super.key, required this.myControl, required this.hint});

  final TextEditingController myControl;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myControl,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
