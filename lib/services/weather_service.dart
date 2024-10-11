import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_forecasting_app/models/hourly_weather.dart';
import 'package:weather_forecasting_app/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();

  // The One Call API endpoint for fetching forecast data
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/onecall';
  final String apiKey = '0956581cd27a6149daa770c3fb47a66f';

  WeatherService(Dio dio);

  // Get current weather for a city
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      // Get coordinates of the city first
      final String geoUrl = 'https://api.openweathermap.org/geo/1.0/direct';
      Response geoResponse =
          await dio.get('$geoUrl?q=$cityName&limit=1&appid=$apiKey');
      final lat = geoResponse.data[0]['lat'];
      final lon = geoResponse.data[0]['lon'];

      // Fetch current weather using lat and lon
      Response weatherResponse = await dio
          .get('$baseUrl?lat=$lat&lon=$lon&units=metric&appid=$apiKey');

      return WeatherModel.fromJson(weatherResponse.data);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // Fetch hourly weather forecast for the next few hours
  Future<List<HourlyWeather>> getHourlyForecast(
      {required String cityName}) async {
    try {
      // Get the coordinates of the city
      final String geoUrl = 'https://api.openweathermap.org/geo/1.0/direct';
      Response geoResponse =
          await dio.get('$geoUrl?q=$cityName&limit=1&appid=$apiKey');
      final lat = geoResponse.data[0]['lat'];
      final lon = geoResponse.data[0]['lon'];

      // Fetch the hourly forecast using the One Call API
      Response hourlyResponse = await dio.get(
          '$baseUrl?lat=$lat&lon=$lon&exclude=current,minutely,daily,alerts&units=metric&appid=$apiKey');

      // Parse the hourly forecast data
      List<HourlyWeather> hourlyForecastList =
          (hourlyResponse.data['hourly'] as List)
              .map((hourlyData) => HourlyWeather.fromJson(hourlyData))
              .toList();

      return hourlyForecastList;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
