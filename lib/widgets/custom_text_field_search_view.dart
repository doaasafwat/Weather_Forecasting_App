import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecasting_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_forecasting_app/views/weather_today_screen.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 243, 241, 241),
        filled: true,
        hintText: ' Search...',
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
        prefixIcon: IconButton(
          onPressed: () async {
            final cityName = controller.text.trim();
            if (cityName.isNotEmpty) {
              await BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(cityName: cityName);
              final weatherModel =
                  BlocProvider.of<GetWeatherCubit>(context).weatherModel;

              if (weatherModel != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherTodayScreen(
                      weatherModel: weatherModel,
                      cityName: cityName,
                    ),
                  ),
                );
              }
            }
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.grey,
            size: 25,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () async {
            final cityName = controller.text.trim();
            if (cityName.isNotEmpty) {
              await BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(cityName: cityName);
              final weatherModel =
                  BlocProvider.of<GetWeatherCubit>(context).weatherModel;

              if (weatherModel != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherTodayScreen(
                      weatherModel: weatherModel,
                      cityName: cityName,
                    ),
                  ),
                );
              }
            }
          },
          icon: Image.asset(
            'assets/images/Icon.png',
            height: 40,
            width: 40,
          ),
        ),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      gapPadding: 1,
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
