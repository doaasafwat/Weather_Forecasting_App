import 'location.dart';
import 'current.dart';
import 'forecast_day.dart';

class WeatherModel {
  final Location location;
  final Current current;
  final List<ForecastDay> forecast;

  WeatherModel(
      {required this.location, required this.current, required this.forecast});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var forecastList = json['forecast']['forecastday'] as List;
    List<ForecastDay> forecastDays =
        forecastList.map((i) => ForecastDay.fromJson(i)).toList();

    return WeatherModel(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
      forecast: forecastDays,
    );
  }
}
