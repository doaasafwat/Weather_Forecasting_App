import 'package:weather_forecasting_app/models/hourly_weather.dart';
class WeatherModel {
  final String cityName;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final int humidity;
  final double windSpeed;
  final double tempDay;
  final String precipitation;
  final int clouds;
  final double uvi;
  final String icon;
  final int pressure;
final List<HourlyWeather> hourlyForecast;

  WeatherModel({
    required this.cityName,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.humidity,
    required this.windSpeed,
    required this.tempDay,
    required this.precipitation,
    required this.clouds,
    required this.uvi,
    required this.icon,
    required this.pressure,
    required this.hourlyForecast,
  });

  // Factory constructor to create a WeatherModel from JSON
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var hourlyForecastList = (json['hourly'] as List)
        .map((hourly) => HourlyWeather.fromJson(hourly))
        .toList();
    
    return WeatherModel(
      temp: (json['main']['temp']).toDouble(),
      minTemp: (json['main']['temp_min']).toDouble(),
      maxTemp: (json['main']['temp_max']).toDouble(),
      tempDay:
          (json['feels_like']['day'] ?? json['main']['feels_like']).toDouble(),
      weatherCondition: json['weather'][0]['description'],
      precipitation: ((json['pop'] ?? 0.0) * 100).toStringAsFixed(0),
      clouds: json['clouds']['all'] ?? 0,
      humidity: json['main']['humidity'],
      uvi: (json['uvi'] ?? 0.0).toDouble(),
      cityName: json['name'],
      windSpeed: (json['wind']['speed']).toDouble(),
      icon: json['weather'][0]['icon'],
      pressure: json['main']['pressure'],
      hourlyForecast: hourlyForecastList,
    );
  }

  static fromDailyJson(dailyData){}
}