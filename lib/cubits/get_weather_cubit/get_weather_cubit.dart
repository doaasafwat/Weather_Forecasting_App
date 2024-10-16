import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_weather_states.dart';
import 'package:weather_forecasting_app/models/weather_model.dart';
import 'package:weather_forecasting_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
  
    } catch (e) {
      
      emit(WeatherFailureState(e.toString()));
    }
  }
}
//