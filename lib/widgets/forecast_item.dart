import 'package:flutter/material.dart';

class ForecastItem extends StatelessWidget {
  final String day;
  final IconData icon;
  final int high;
  final int low;

  const ForecastItem({
    super.key,
    required this.day,
    required this.icon,
    required this.high,
    required this.low,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                day,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 20),
            ],
          ),
          Column(
            children: [
              Text(
                '$high°',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '$low°',
                style: const TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
