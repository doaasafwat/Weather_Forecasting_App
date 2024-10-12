class Day {
  final double maxTemperature;
  final double minTemperature;
  final String condition;

  Day({
    required this.maxTemperature,
    required this.minTemperature,
    required this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxTemperature: json['maxtemp_c'],
      minTemperature: json['mintemp_c'],
      condition: json['condition']['text'],
    );
  }
}
