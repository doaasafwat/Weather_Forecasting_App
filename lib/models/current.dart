class Current {
  final num temperature;
  final String condition;
  final num humidity;
  final num windSpeed;
  final String iconUrl;

  Current({
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.iconUrl,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      temperature: json['temp_c'],
      condition: json['condition']['text'],
      humidity: json['humidity'],
      windSpeed: json['wind_kph'],
      iconUrl: json['condition']['icon'],
    );
  }
}
