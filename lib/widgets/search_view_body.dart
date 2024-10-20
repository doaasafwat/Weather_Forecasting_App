import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecasting_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_forecasting_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_forecasting_app/services/weather_service.dart';
import 'package:weather_forecasting_app/views/weather_today_screen.dart';
import 'package:weather_forecasting_app/widgets/custom_text_field_search_view.dart';
import 'package:weather_forecasting_app/widgets/header_search_view.dart';
import 'package:weather_forecasting_app/widgets/weather_forecast_details_body.dart';
import 'package:weather_forecasting_app/widgets/weather_info_card_grid_view.dart';

class SearchViewBody extends StatefulWidget {
  final WeatherService weatherService = WeatherService(Dio());

  SearchViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchViewBodyState createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {
    List<String> cities = [
      'Cairo',
      'London',
      'Paris',
      'Tokyo',
      'New York',
      'Alex'
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            const HeaderSearchView(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CustomSearchTextField(),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: .5,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        var getWeatherCubit = context.read<GetWeatherCubit>();
                        getWeatherCubit.getWeatherFromLocation();
                      },
                      icon: const Icon(
                        Icons.location_on_outlined,
                        color: Color(0xff8458FF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: WeatherForecastDetailsBody(
                  weatherService: widget.weatherService),
            ),
            WeatherInfoCardGridView(
              citys: cities,
              weatherService: widget.weatherService,
            ),
          ],
        ),
      ),
    );
  }
}

// استخدام BlocListener للاستجابة لحالة الطقس
class WeatherBlocListener extends StatelessWidget {
  const WeatherBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetWeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is LoadedWeatherState) {
          final weatherModel = state.weatherModel;
          final hour = weatherModel.forecast[0].hour.first;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WeatherTodayScreen(
                weatherModel: weatherModel,
                hour: hour,
              ),
            ),
          );
        } else if (state is FailureWeatherState) {
          final errorMessage = state.error;
          print("Error fetching weather: $errorMessage");
        }
      },
      child: SearchViewBody(),
    );
  }
}
