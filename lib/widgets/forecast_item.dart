import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecasting_app/widgets/temperature_unit_provider.dart';
class ForecastItem extends StatelessWidget {
  final String day;
  final IconData icon;
  final int high;
  final int low;

  const ForecastItem({
    super.key,
    required this.day,
    required this.icon,
    required this.high,
    required this.low,
  });

  @override
  Widget build(BuildContext context) {
     var temperatureNotifier = Provider.of<TemperatureUnitNotifier>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                day,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 20),
            ],
          ),
          Column(
            children: [
              Text(
                 '${displayTemperature(high, temperatureNotifier.isCelsius).toStringAsFixed(1)} ${temperatureNotifier.isCelsius ? '°C':'°F'}',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '${displayTemperature(low, temperatureNotifier.isCelsius).toStringAsFixed(1)} ${temperatureNotifier.isCelsius ? '°C':'°F'}',
                style: const TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
      num displayTemperature(num temp, bool isCelsius) {
    if (isCelsius) {
      return temp; 
    } else {
      return (temp * 9 / 5) + 32; 
    }
  }
}
