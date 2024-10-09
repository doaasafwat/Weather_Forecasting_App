
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: 'AIzaSyCimcLXU_ljHzhdGmjU1Bg3Ubx6XmUFdWQ',
          appId: '1:608401309663:android:14872147e884127fa18e6a',
          messagingSenderId: '608401309663',
          projectId: 'weatherapp-f74f7',
        ))
      : await Firebase.initializeApp();
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
        home: const SplashView());
  }
}
