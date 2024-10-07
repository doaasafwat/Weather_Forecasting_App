import 'package:flutter/material.dart';

Widget buildTextField(String hintText, bool isPassword, double screenHeight) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF1D2837),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF6A55E0)),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility, color: Colors.grey),
              )
            : null,
      ),
    );
  }
