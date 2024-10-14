import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatelessWidget {
  final String data;
  final String condition;
  final num maxTemperature; 
  final num minTemperature;
  final bool isCelsius; 
  final String aqi;
  final String iconUrl;
  final String sunrise;
  final String sunset;

  WeatherCard({
    required this.data,
    required this.condition,
    required this.maxTemperature,
    required this.minTemperature,
    required this.aqi,
    required this.iconUrl,
    required this.sunrise,
    required this.sunset,
    required this.isCelsius, 
  });

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
          formatDay(data),
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          formatDate(data),
          style: const TextStyle(fontSize: 14, color: Colors.white70),
        ),
        const SizedBox(height: 8),
        Image.network(
          'https:$iconUrl',
        ),
        const SizedBox(height: 8),
        Text(
          condition,
          style: const TextStyle(
              fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          '${displayTemperature(maxTemperature)}° ${isCelsius ? 'C' : 'F'} / ${displayTemperature(minTemperature)}° ${isCelsius ? 'C' : 'F'}',
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          'AQI ${aqi}',
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ]),
    );
  }

  num displayTemperature(num temp) {
    if (isCelsius) {
      return temp; 
    } else {
      return (temp * 9 / 5) + 32; 
    }
  }

  String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd MMM').format(parsedDate);
  }

  String formatDay(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('EEEE').format(parsedDate);
  }
}
