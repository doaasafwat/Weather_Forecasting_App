import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String temp;
  final IconData icon;

  const HourlyForecastItem({
    Key? key,
    required this.time,
    required this.temp,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          time,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(
          height: 20,
        ),
        Icon(icon, color: Colors.white),
        SizedBox(
          height: 20,
        ),
        Text(
          temp,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
