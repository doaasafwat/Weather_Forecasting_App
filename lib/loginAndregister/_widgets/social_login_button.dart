// import 'package:flutter/material.dart';

// class SocialLoginButton extends StatelessWidget {
//   final IconData icon;
//   final Color color;
//   final double screenWidth;

//   const SocialLoginButton({
//     super.key,
//     required this.icon,
//     required this.color,
//     required this.screenWidth,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: screenWidth * 0.26, // Responsive width
//       height: screenWidth * 0.16,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Icon(
//         icon,
//         color: Colors.white,
//         size: screenWidth * 0.1,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;

  const SocialLoginButton({
    super.key,
    required this.assetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            assetPath,
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}
