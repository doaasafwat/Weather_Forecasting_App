import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecasting_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_forecasting_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_forecasting_app/views/weather_today_screen.dart';
import 'package:weather_forecasting_app/widgets/oops.dart';
import 'package:weather_forecasting_app/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D2837),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherInitialState) {
          return  SearchViewBody();
        } else if (state is WeatherLoadedState) {
          return WeatherTodayScreen(
            weatherModel: state.weatherModel,
            hour: state.weatherModel.forecast[0].hour[0],
          );
        } else if (state is WeatherFailureState) {
          return Oops(
            message: state.errorMessage,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
