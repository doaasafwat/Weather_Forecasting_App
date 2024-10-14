import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/models/weather_model.dart';
import 'package:weather_forecasting_app/services/weather_service.dart';
import 'package:weather_forecasting_app/widgets/weather_info_card_item.dart';

class WeatherInfoCardGridView extends StatelessWidget {
  const WeatherInfoCardGridView({
    super.key,
    required this.citys,
    required this.weatherService,
  });

  final List<String> citys;
  final WeatherService weatherService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemCount: citys.length,
              itemBuilder: (context, index) {
                String cityName = citys[index];

                return FutureBuilder<WeatherModel>(
                  future: weatherService.getForcast(cityName: cityName),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error fetching data'));
                    } else if (snapshot.hasData) {
                      WeatherModel weather = snapshot.data!;

                      return WeatherInfoCardItem(
                        image: weather.current.iconUrl,
                        aqi: weather.current.humidity.toString(),
                        city: weather.location.name,
                        condition: weather.current.condition,
                        temp: '${weather.current.temperature}°',
                        time: weather.forecast[0].date,
                      );
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
