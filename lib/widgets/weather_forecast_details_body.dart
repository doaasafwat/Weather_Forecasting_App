import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/widgets/weather_card_list_view.dart';

class WeatherForecastDetailsBody extends StatelessWidget {
  const WeatherForecastDetailsBody({super.key});

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
        child: const Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "New York",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  "Hongkong",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Text(
                  "Tokyo",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
            Divider(
              color: Color(0xffFFFFFF),
              thickness: 0.1,
              indent: 12,
              endIndent: 12,
            ),
            Expanded(child: WeatherCardListView()),
          ],
        ),
      ),
    );
  }
}
