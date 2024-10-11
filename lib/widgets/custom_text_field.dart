import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key, required this.label, required this.controller});
  final String? label;
final TextEditingController? controller;
  @override
  State<TextFieldWidget> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldWidget> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(controller: widget.controller,
        obscureText: _obscureText,
        style: const TextStyle(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
          labelText:widget.label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: _togglePasswordVisibility,
          ),
        ),
      ),
    );
  }
}