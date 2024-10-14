import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/services/weather_service.dart';
import 'package:weather_forecasting_app/widgets/custom_text_field_search_view.dart';
import 'package:weather_forecasting_app/widgets/header_search_view.dart';
import 'package:weather_forecasting_app/widgets/weather_forecast_details_body.dart';
import 'package:weather_forecasting_app/widgets/weather_info_card_grid_view.dart';

class SearchViewBody extends StatelessWidget {
  final WeatherService weatherService = WeatherService(Dio());

  SearchViewBody({super.key});

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
              child: CustomSearchTextField(),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: WeatherForecastDetailsBody(weatherService: weatherService), // تمرير WeatherService
            ),
            WeatherInfoCardGridView(
              citys: cities,
              weatherService: weatherService,
            ),
          ],
        ),
      ),
    );
  }
}
