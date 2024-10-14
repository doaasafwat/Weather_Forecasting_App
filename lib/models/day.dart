class Day {
  final num maxTemperature; 
  final num minTemperature; 
  final num maxTemperatureF;
  final num minTemperatureF; 
  final String condition;

  Day({
    required this.maxTemperature,
    required this.minTemperature,
    required this.maxTemperatureF,
    required this.minTemperatureF,
    required this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxTemperature: json['maxtemp_c'],
      minTemperature: json['mintemp_c'],
      maxTemperatureF: json['maxtemp_f'], 
      minTemperatureF: json['mintemp_f'],
      condition: json['condition']['text'],
    );
  }
}
