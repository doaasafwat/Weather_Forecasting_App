import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherInfoCardItem extends StatelessWidget {
  const WeatherInfoCardItem({
    super.key,
    required this.city,
    required this.condition,
    required this.aqi,
    required this.temp,
    required this.time,
    required this.image,
  });

  final String city;
  final String condition;
  final String aqi;
  final String temp;
  final String time;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xff1D2837),
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
                const Spacer(),
                Text(
                  formatDate(time),
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
                  Image.network(
                    'https:$image',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    condition,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  'AQI: $aqi',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                const Spacer(),
                Text(
                  temp,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd MMM').format(parsedDate);
  }
}
