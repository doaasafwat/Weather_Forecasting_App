import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/cubits/get_weather_cubit/get_weather_states.dart';

import 'package:weather_forecasting_app/models/weather_model.dart';
import 'package:weather_forecasting_app/widgets/forecast_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecasting_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherForecastScreen extends StatelessWidget {
  const WeatherForecastScreen(
      {super.key, required this.cityName, required this.weatherModel});
  final String cityName;
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
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.location_pin, color: Colors.purpleAccent),
            const SizedBox(width: 5),
            Text(cityName,
                style: const TextStyle(color: Colors.white, fontSize: 18)),
            const Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.network(
                            'https:${weatherModel.current.iconUrl}',
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Text(
                            '${weatherModel.current.temperature.toString()}°',
                            style: const TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            weatherModel.current.condition,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
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
                const SizedBox(height: 20),
                const Text(
                  '3-Days Forecast',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 22),
                Expanded(
                  child: ListView.builder(
                    itemCount: weatherModel.forecast.length,
                    itemBuilder: (context, index) {
                      final day = weatherModel.forecast[index];
                      return ForecastItem(
                        day: day.date,
                        icon: Icons.wb_sunny,
                        high: day.day.maxTemperature.toInt(),
                        low: day.day.minTemperature.toInt(),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  
}
