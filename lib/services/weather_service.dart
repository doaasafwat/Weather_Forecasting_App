import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_forecasting_app/models/weather_model.dart';
import 'package:weather_forecasting_app/widgets/oops.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'dd4a5599598646c1a3a134006240609';

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Response response =
        await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }

  Future<WeatherModel> getForcast({required cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          Oops(message: e.message!).toString();
      // TODO
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(Oops(message: e.toString()).toString());
    }
  }
}
