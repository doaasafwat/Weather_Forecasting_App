import 'package:weather_forecasting_app/models/day.dart';
import 'package:weather_forecasting_app/models/hour.dart';

class ForecastDay {
  final String date;
  final Day day; 
  final List<Hour> hour;
  final String sunrise; 
  final String sunset;  
  final String iconUrl; 

  ForecastDay({
    required this.date,
    required this.day,
    required this.hour,
    required this.sunrise,
    required this.sunset,
    required this.iconUrl,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    var hourList = json['hour'] as List;
    List<Hour> hours = hourList.map((i) => Hour.fromJson(i)).toList();

    return ForecastDay(
      date: json['date'],
      day: Day.fromJson(json['day']),
      hour: hours,
      sunrise: json['astro']['sunrise'], 
      sunset: json['astro']['sunset'],  
      iconUrl: json['day']['condition']['icon'], 
    );
  }
}
