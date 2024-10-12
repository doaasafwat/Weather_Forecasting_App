import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/models/weather_model.dart';
import 'package:weather_forecasting_app/widgets/hourly_forecast_item.dart';
import 'package:weather_forecasting_app/widgets/weather_stat.dart';

class WeatherTodayScreen extends StatelessWidget {
  const WeatherTodayScreen({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

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
                  Image.asset('assets/images/Image.png'),
                  const SizedBox(height: 12),
                  Text(
                    "condition",
                    style: const TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'temp°',
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
                WeatherStat(unit: 'Km/s', value: '17', color: Colors.purple),
                WeatherStat(unit: 'hPa', value: '1', color: Colors.purple),
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HourlyForecastItem(
                          time: '9AM', temp: '18°', icon: Icons.wb_cloudy),
                      HourlyForecastItem(
                          time: '10AM', temp: '19°', icon: Icons.wind_power),
                      HourlyForecastItem(
                          time: '11AM', temp: '24°', icon: Icons.wb_cloudy),
                      HourlyForecastItem(
                          time: '12PM', temp: '25°', icon: Icons.wb_sunny),
                      HourlyForecastItem(
                          time: '1PM', temp: '26°', icon: Icons.wb_sunny),
                    ],
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
