import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/models/hour.dart';
import 'package:weather_forecasting_app/models/weather_model.dart';
import 'package:weather_forecasting_app/views/weather_forecast_screen.dart';
import 'package:weather_forecasting_app/widgets/hourly_forecast_item.dart';
import 'package:weather_forecasting_app/widgets/temperature_unit_provider.dart';
import 'package:weather_forecasting_app/widgets/weather_icons.dart';
import 'package:weather_forecasting_app/widgets/weather_stat.dart';
import 'package:provider/provider.dart';

class WeatherTodayScreen extends StatelessWidget {
  final WeatherModel weatherModel;
  final Hour hour;

  const WeatherTodayScreen(
      {super.key, required this.weatherModel, required this.hour});

  @override
  Widget build(BuildContext context) {
    var temperatureNotifier = Provider.of<TemperatureUnitNotifier>(context);
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, true);
          return false;
        },
        child: Scaffold(
          backgroundColor: const Color(0xFF1D2837),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_pin, color: Colors.purpleAccent),
                const SizedBox(width: 5),
                Text(
                  weatherModel.location.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.network(
                        'https:${weatherModel.current.iconUrl}',
                        height: 100,
                        width: 200,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        weatherModel.current.condition,
                        style: const TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${displayTemperature(weatherModel.current.temperature, temperatureNotifier.isCelsius).toStringAsFixed(1)} ${temperatureNotifier.isCelsius ? '°C' : '°F'}',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WeatherStat(
                      unit: '%',
                      value: '${weatherModel.current.humidity}',
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
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WeatherForecastScreen(
                                    cityName: weatherModel.location.name,
                                    weatherModel: weatherModel,
                                  ),
                                ),
                              );
                            },
                            child: const Center(
                              child: Text(
                                "3 Days",
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
                        children:
                            weatherModel.forecast[0].hour.take(5).map((hour) {
                          String time = hour.time.contains(' ')
                              ? hour.time.split(' ')[1]
                              : hour.time;

                          return HourlyForecastItem(
                            time: time,
                            temp:
                                '${displayTemperature(hour.temperature, temperatureNotifier.isCelsius).toStringAsFixed(1)} ${temperatureNotifier.isCelsius ? '°' : '°'}',
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
        ));
  }

  num displayTemperature(num temp, bool isCelsius) {
    if (isCelsius) {
      return temp;
    } else {
      return (temp * 9 / 5) + 32;
    }
  }
}
