import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/models/weather_model.dart';
import 'package:weather_forecasting_app/services/weather_service.dart';
import 'package:weather_forecasting_app/widgets/weather_card_list_view.dart';

class WeatherForecastDetailsBody extends StatefulWidget {
  const WeatherForecastDetailsBody({super.key, required this.weatherService});

  final WeatherService weatherService;

  @override
  _WeatherForecastDetailsBodyState createState() =>
      _WeatherForecastDetailsBodyState();
}

class _WeatherForecastDetailsBodyState
    extends State<WeatherForecastDetailsBody> {
  String selectedCity = 'New York'; 
  late Future<WeatherModel> weatherData;
bool isCelsius = true;
  @override
  void initState() {
    super.initState();
    weatherData = widget.weatherService.getCurrentWeather(
        cityName: selectedCity); 
  }

  void _selectCity(String city) {
    setState(() {
      selectedCity = city;
      weatherData = widget.weatherService.getCurrentWeather(
          cityName: selectedCity); 
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: 343,
        height: 265,
        decoration: BoxDecoration(
          color: const Color(0xff483383),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => _selectCity("New York"),
                  child: Text(
                    "New York",
                    style: TextStyle(
                      fontSize: 20,
                      color: selectedCity == "New York"
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectCity("Hongkong"),
                  child: Text(
                    "Hongkong",
                    style: TextStyle(
                      fontSize: 20,
                      color: selectedCity == "Hongkong"
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectCity("Tokyo"),
                  child: Text(
                    "Tokyo",
                    style: TextStyle(
                      fontSize: 20,
                      color:
                          selectedCity == "Tokyo" ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Color(0xffFFFFFF),
              thickness: 0.1,
              indent: 12,
              endIndent: 12,
            ),
            Expanded(
              child: FutureBuilder<WeatherModel>(
                future: weatherData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return WeatherCardListView(
                     
                        weatherModel: snapshot.data!); 
                  } else {
                    return const Center(child: Text('No data found'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
