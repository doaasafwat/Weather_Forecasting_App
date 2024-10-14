class Hour {
  final String time;
  final num temperature;
  final String condition;
  final num windSpeed;
  final num humidity;
  final String iconUrl;

  Hour({
    required this.time,
    required this.temperature,
    required this.condition,
    required this.windSpeed,
    required this.humidity,
    required this.iconUrl,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      time: json['time'],
      temperature: json['temp_c'],
      condition: json['condition']['text'],
      windSpeed: json['wind_kph'],
      humidity: json['humidity'],
      iconUrl: json['condition']['icon'],
    );
  }
}
