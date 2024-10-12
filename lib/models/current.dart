class Current {
  final double temperature;
  final String condition;
  final double humidity;
  final double windSpeed;

  Current({
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      temperature: json['temp_c'],
      condition: json['condition']['text'],
      humidity: json['humidity'],
      windSpeed: json['wind_kph'],
    );
  }
}
