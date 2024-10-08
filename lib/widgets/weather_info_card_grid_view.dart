import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/widgets/weather_info_card_item.dart';

class WeatherInfoCardGridView extends StatelessWidget {
  const WeatherInfoCardGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child:  WeatherInfoCardItem(
                  aqi: 'AQI 70',
                  city: 'New York',
                  condition: 'partly cloudy',
                  temp: '-5°-0°',
                  time: '09:30',
                ),
              ),
              SizedBox(width: 10), 
              Expanded(
                child:  WeatherInfoCardItem(
                  aqi: 'AQI 70',
                  city: 'New York',
                  condition: 'partly cloudy',
                  temp: '-5°-0°',
                  time: '09:30',
                ),
              ),
            ],
          ),
          SizedBox(height: 10), 
          Row(
            children: [
              Expanded(
                child:  WeatherInfoCardItem(
                  aqi: 'AQI 70',
                  city: 'New York',
                  condition: 'partly cloudy',
                  temp: '-5°-0°',
                  time: '09:30',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child:  WeatherInfoCardItem(
                  aqi: 'AQI 70',
                  city: 'New York',
                  condition: 'partly cloudy',
                  temp: '-5°-0°',
                  time: '09:30',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
