class Hour {
  final String time;
  final double temperature;
  final String condition;
  final double windSpeed;
  final double humidity;

  Hour({
    required this.time,
    required this.temperature,
    required this.condition,
    required this.windSpeed,
    required this.humidity,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      time: json['time'],
      temperature: json['temp_c'],
      condition: json['condition']['text'],
      windSpeed: json['wind_kph'],
      humidity: json['humidity'],
    );
  }
}
