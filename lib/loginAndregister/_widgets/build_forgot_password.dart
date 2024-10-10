import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/views/create_new_password.dart';

class BuildForgetPassword extends StatelessWidget {
  const BuildForgetPassword({super.key});

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
