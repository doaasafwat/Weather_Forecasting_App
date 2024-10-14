import 'package:flutter/material.dart';

//     return TextField(
//       style: const TextStyle(color: Colors.white),
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: const TextStyle(color: Colors.grey),
//         filled: true,
//         fillColor: const Color(0xFF1D2837),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.white),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Color(0xFF6A55E0)),
//         ),
//         suffixIcon: isPassword
//             ? IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.visibility, color: Colors.grey),
//               )
//             : null,
//       ),
//     );
//   }
class BuildTextField extends StatelessWidget {
  const BuildTextField({
    super.key,
    required this.hintText,
    required this.isPassword,
    required this.screenHeight,
    this.controller,
    this.isPasswordVisible = false,
    this.onTogglePasswordVisibility,
  });
  final String hintText;
  final bool isPassword;
  final double screenHeight;
  final TextEditingController? controller;
  final bool isPasswordVisible; // New variable to track password visibility
  final VoidCallback?
      onTogglePasswordVisibility; // Callback for toggling visibility

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      obscureText: isPassword && !isPasswordVisible, // Show or hide password
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
                onPressed:
                    onTogglePasswordVisibility, // Call the toggle function
                icon: Icon(
                  isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
              )
            : null,
      ),
    );
  }
}
