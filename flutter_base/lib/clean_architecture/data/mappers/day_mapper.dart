import 'package:flutter_base/clean_architecture/data/models/api_day.dart';

import '../../domain/entities/day.dart';

extension DayMapper on ApiDay {
  Day toEntity() {
    return Day(
      sunrise: DateTime.tryParse(sunrise) ?? DateTime.now(),
      sunset: DateTime.tryParse(sunset) ?? DateTime.now(),
      solarNoon: DateTime.tryParse(solarNoon) ?? DateTime.now(),
      dayLength: dayLength
    );
  }
}