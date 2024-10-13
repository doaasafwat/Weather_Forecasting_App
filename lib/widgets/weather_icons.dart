import 'package:flutter/material.dart';

IconData getWeatherIcon(String condition) {
  IconData weatherIcon;

  if (condition.contains('Sunny')) {
    weatherIcon = Icons.wb_sunny;
  } else if (condition.contains('Partly Cloudy')) {
    weatherIcon = Icons.wb_cloudy;
  } else if (condition.contains('Cloudy')) {
    weatherIcon = Icons.cloud;
  } else if (condition.contains('Overcast')) {
    weatherIcon = Icons.cloud;
  } else if (condition.contains('Rain')) {
    weatherIcon = Icons.umbrella;
  } else if (condition.contains('Snow')) {
    weatherIcon = Icons.ac_unit;
  } else if (condition.contains('Thunderstorm')) {
    weatherIcon = Icons.bolt;
  } else if (condition.contains('Fog') || condition.contains('Haze')) {
    weatherIcon = Icons.blur_on;
  } else if (condition.contains('Windy')) {
    weatherIcon = Icons.air;
  } else {
    weatherIcon = Icons.wb_sunny;
  }

  return weatherIcon;
}
