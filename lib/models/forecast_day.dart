import 'hour.dart';
import 'day.dart';

class ForecastDay {
  final String date;
  final Day day;
  final List<Hour> hour;

  ForecastDay({required this.date, required this.day, required this.hour});

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    var hourList = json['hour'] as List;
    List<Hour> hours = hourList.map((i) => Hour.fromJson(i)).toList();

    return ForecastDay(
      date: json['date'],
      day: Day.fromJson(json['day']),
      hour: hours,
    );
  }
}
