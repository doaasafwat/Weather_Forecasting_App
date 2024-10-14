import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String temp;
  final IconData icon;

  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.temp,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          time,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        Icon(icon, color: Colors.white),
        const SizedBox(
          height: 20,
        ),
        Text(
          temp,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
