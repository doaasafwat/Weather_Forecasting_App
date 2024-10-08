import 'package:flutter/material.dart';

import 'package:weather_forecasting_app/loginAndregister/_widgets/social_login_button.dart';

Widget buildSocialLoginButtons(double screenWidth) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Flexible(
          child: SocialLoginButton(
              assetPath: 'assets/images/f.png', onTap: () {})),
      const SizedBox(
        width: 5,
      ),
      Flexible(
          child: SocialLoginButton(
              assetPath: 'assets/images/g.png', onTap: () {})),
      const SizedBox(
        width: 5,
      ),
      Flexible(
          child: SocialLoginButton(
              assetPath: 'assets/images/a.png', onTap: () {})),
    ],
  );
}
