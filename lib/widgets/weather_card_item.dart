import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard(
      {super.key,
      required this.day,
      required this.data,
      required this.condition,
      required this.tempRange,
      required this.aqi});

  final String day, data, condition, tempRange, aqi;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 156,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        color: const Color(0xff483383),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          day,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          data,
          style: const TextStyle(fontSize: 14, color: Colors.white70),
        ),
        const SizedBox(height: 8),
        Image.asset('assets/images/01_sunny_color.png'),
        const SizedBox(height: 8),
        Text(
          condition,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          tempRange,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          aqi,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ]),
    );
  }
}
