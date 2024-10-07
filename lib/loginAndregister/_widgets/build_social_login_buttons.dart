import 'package:flutter/material.dart';

import 'package:weather_forecasting_app/loginAndregister/_widgets/social_login_button.dart';

Widget buildSocialLoginButtons(double screenWidth) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SocialLoginButton(assetPath: 'assets/images/f.png', onTap: () {}),
      SocialLoginButton(assetPath: 'assets/images/g.png', onTap: () {}),
      SocialLoginButton(assetPath: 'assets/images/a.png', onTap: () {}),
    ],
  );
}
