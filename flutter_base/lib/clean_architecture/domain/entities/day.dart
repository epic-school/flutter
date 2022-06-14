class Day {
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime solarNoon;
  final String dayLength;

  Day({
    required this.sunrise,
    required this.sunset,
    required this.solarNoon,
    required this.dayLength,
  });

  Day copyWith({DateTime? sunrise, DateTime? sunset, DateTime? solarNoon, String? dayLength}) {
    return Day(
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      solarNoon: solarNoon ?? this.solarNoon,
      dayLength: dayLength ?? this.dayLength
    );
  }
}
