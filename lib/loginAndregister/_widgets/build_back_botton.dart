 import 'package:flutter/material.dart';

Widget buildBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: FloatingActionButton.small(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0xFF1D2837),
        ),
      ),
    );
  }
