import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/models/weather_model.dart';
import 'package:weather_forecasting_app/widgets/weather_card_item.dart';

class WeatherCardListView extends StatelessWidget {
  const WeatherCardListView({super.key, required this.weatherModel});

  final WeatherModel weatherModel;


  @override
  Widget build(BuildContext context) {
    List<WeatherCard> items = weatherModel.forecast.map((forecastDay) {
      return WeatherCard(
        data: forecastDay.date,
        condition: forecastDay.day.condition,
        maxTemperature: forecastDay.day.maxTemperature, 
        minTemperature: forecastDay.day.minTemperature, 
        aqi: forecastDay.day.minTemperature.toString(),
        iconUrl: forecastDay.iconUrl,
        sunrise: forecastDay.sunrise,
        sunset: forecastDay.sunset,
      );
    }).toList();

    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return items[index];
      },
    );
  }
}
