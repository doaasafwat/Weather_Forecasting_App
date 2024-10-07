import 'package:flutter/material.dart';

import 'package:weather_forecasting_app/loginAndregister/_widgets/login_view_body.dart';



class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
