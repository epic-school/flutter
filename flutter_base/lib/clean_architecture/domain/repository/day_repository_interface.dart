import '../entities/day.dart';

abstract class DayRepositoryInterface {
  Future<Day> getDay({
    required double latitude,
    required double longitude,
  });
}