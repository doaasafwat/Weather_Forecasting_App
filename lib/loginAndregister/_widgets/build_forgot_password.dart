import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/views/create_new_password.dart';




class BuildForgotPassword extends StatelessWidget {
  const BuildForgotPassword({super.key, required this.textColor, this.onTap});
  final Color textColor;
  final VoidCallback ? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateNewPassword(),
            ),
          );
        },
        child: Text(
          'Forgot Password? ',
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),

       
        ),
      ),
    );
  }
}
