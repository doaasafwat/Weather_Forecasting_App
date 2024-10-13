import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/models/hour.dart';
import 'package:weather_forecasting_app/models/weather_model.dart';
import 'package:weather_forecasting_app/widgets/hourly_forecast_item.dart';
import 'package:weather_forecasting_app/widgets/weather_icons.dart';
import 'package:weather_forecasting_app/widgets/weather_stat.dart';

class WeatherTodayScreen extends StatelessWidget {
  const WeatherTodayScreen(
      {super.key, required this.weatherModel, required this.hour});

  final WeatherModel weatherModel;
  final Hour hour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D2837),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_pin, color: Colors.purpleAccent),
            SizedBox(width: 5),
            Text(
              'New York',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Weather Info
            Center(
              child: Column(
                children: [
                  Image.network(
                    'https:${weatherModel.current.iconUrl}',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    weatherModel.current.condition,
                    style: const TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${weatherModel.current.temperature}°',
                    style: const TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [Image.asset('assets/images/temperature.png')],
                )
              ],
            ),
            const SizedBox(height: 52),
            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherStat(
                  unit: '%',
                  value: '12',
                  color: Colors.purple,
                ),
                WeatherStat(
                    unit: '%',
                    value: '${weatherModel.current.humidity}',
                    color: Colors.purple),
                WeatherStat(
                    unit: 'Km/h',
                    value: '${weatherModel.current.windSpeed}',
                    color: Colors.purple)
              ],
            ),
            const SizedBox(height: 22),
            // Hourly Forecast
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Today',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/forecast'),
                        child: const Center(
                          child: Text(
                            "7 Days",
                            style: TextStyle(
                              color: Colors.purpleAccent,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: weatherModel.forecast[0].hour.take(5).map((hour) {
                      String time = hour.time.contains(' ')
                          ? hour.time.split(' ')[1]
                          : hour.time;

                      return HourlyForecastItem(
                        time: time,
                        temp: '${hour.temperature}°',
                        icon: getWeatherIcon(hour.condition),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
