import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/views/splash_view.dart';

void main() {
  runApp(const WeatherForeCast());
}

class WeatherForeCast extends StatelessWidget {
  const WeatherForeCast({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF1D2837),
        body: SplashView(),
      ),
    );
  }
}
