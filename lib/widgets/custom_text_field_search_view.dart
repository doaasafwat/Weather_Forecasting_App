import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecasting_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key});

  final textController = TextEditingController();
  final textKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: textKey,
      child: TextFormField(
        controller: textController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This Field is required';
          }
          return null;
        },
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 243, 241, 241),
          filled: true,
          hintText: 'Search...',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          prefixIcon: IconButton(
            onPressed: () {
              if (textKey.currentState!.validate()) {
                context
                    .read<GetWeatherCubit>()
                    .getWeather(cityName: textController.text.trim());

              }
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.grey,
              size: 25,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              if (textKey.currentState!.validate()) {
                context
                    .read<GetWeatherCubit>()
                    .getWeather(cityName: textController.text.trim());
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
