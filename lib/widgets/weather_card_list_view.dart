import 'package:flutter/cupertino.dart';
import 'package:weather_forecasting_app/widgets/weather_card_item.dart';

class WeatherCardListView extends StatelessWidget {
  const WeatherCardListView({super.key});
  static const items = [
    WeatherCard(
      day: 'Today',
      data: 'Mar 6',
      condition: 'Sunny',
      tempRange: '15-20℃',
      aqi: 'AQI 67',
    ),
    WeatherCard(
      day: 'Today',
      data: 'Mar 6',
      condition: 'Sunny',
      tempRange: '15-20℃',
      aqi: 'AQI 67',
    ),
    WeatherCard(
      day: 'Today',
      data: 'Mar 6',
      condition: 'Sunny',
      tempRange: '15-20℃',
      aqi: 'AQI 67',
    ),
    WeatherCard(
      day: 'Today',
      data: 'Mar 6',
      condition: 'Sunny',
      tempRange: '15-20℃',
      aqi: 'AQI 67',
    ),
    WeatherCard(
      day: 'Today',
      data: 'Mar 6',
      condition: 'Sunny',
      tempRange: '15-20℃',
      aqi: 'AQI 67',
    ),
    WeatherCard(
      day: 'Today',
      data: 'Mar 6',
      condition: 'Sunny',
      tempRange: '15-20℃',
      aqi: 'AQI 67',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return items[index];
      },
    );
  }
}
