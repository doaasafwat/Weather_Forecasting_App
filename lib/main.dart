import 'package:flutter/material.dart';

import 'package:weather_forecasting_app/views/splash_view.dart';

void main() {
  runApp(const WeatherForeCast());
}

class WeatherForeCast extends StatelessWidget {
  const WeatherForeCast({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff1D2837),
      ),
      home: const Scaffold(
        body: SplashView(),
      ),
    );
  }
}
