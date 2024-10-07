 import 'package:flutter/material.dart';

Widget buildDividerWithText(String text) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.white)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        const Expanded(child: Divider(color: Colors.white)),
      ],
    );
  }
