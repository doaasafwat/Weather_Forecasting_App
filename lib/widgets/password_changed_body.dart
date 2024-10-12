import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/loginAndregister/_views/login_screen.dart';

import 'package:weather_forecasting_app/widgets/custom_button.dart';

class PasswordChangedBody extends StatelessWidget {
  const PasswordChangedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1D2837),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/Sticker.png'),
            const SizedBox(height: 60),
            const DefaultTextStyle(
              style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
              child: Text(' Password Changed!'),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 13),
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w200),
                child: Text(
                  'Your password has been changed successfully.',
                ),
              ),
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: 'Okey',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
