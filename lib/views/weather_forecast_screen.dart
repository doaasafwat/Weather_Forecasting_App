import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/widgets/forecast_item.dart';

class WeatherForecastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D2837),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_pin, color: Colors.purpleAccent),
            SizedBox(width: 5),
            Text('New York',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current weather section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/Image.png',
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Text(
                        '24°',
                        style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'Partly Cloudy',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/temperature.png',
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            // 7-Day Forecast Heading
            Text(
              '7-Days Forecast',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 22),
            // List of forecast items
            Expanded(
              child: ListView(
                children: [
                  ForecastItem(
                      day: 'Mon', icon: Icons.wb_sunny, high: 24, low: 13),
                  ForecastItem(
                      day: 'Tue', icon: Icons.cloud, high: 24, low: 13),
                  ForecastItem(day: 'Wed', icon: Icons.bolt, high: 24, low: 13),
                  ForecastItem(
                      day: 'Thu', icon: Icons.wb_sunny, high: 24, low: 13),
                  ForecastItem(day: 'Fri', icon: Icons.bolt, high: 24, low: 13),
                  ForecastItem(
                      day: 'Sat', icon: Icons.wb_cloudy, high: 24, low: 13),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
