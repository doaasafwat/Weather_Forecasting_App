import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_forecasting_app/views/weather_forecast_details_view.dart';
import 'package:weather_forecasting_app/widgets/custom_text_field_search_view.dart';
import 'package:weather_forecasting_app/widgets/header_search_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const HeaderSearchView(),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomSearchTextField(),
        ),
        WeatherForecastDetailsView(),
      ],
    );
  }
}
