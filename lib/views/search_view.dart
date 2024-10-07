import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF1D2837),
      body: SearchViewBody(),
    );
  }
}
