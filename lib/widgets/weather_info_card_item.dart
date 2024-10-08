import 'package:flutter/material.dart';

class WeatherInfoCardItem extends StatelessWidget {
  const WeatherInfoCardItem({
    super.key,
    required this.city,
    required this.condition,
    required this.aqi,
    required this.temp,
    required this.time,
  });

  final String city;
  final String condition;
  final String aqi;
  final String temp;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      width: 168,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  city,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF)),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Image (2).png',
                  ),
                  Text(
                    condition,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              children: [
                Text(
                  aqi,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  temp,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
