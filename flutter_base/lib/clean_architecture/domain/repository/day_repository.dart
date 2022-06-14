import 'package:flutter_base/clean_architecture/data/providers/sunrise_provider_interface.dart';
import 'package:flutter_base/clean_architecture/domain/entities/day.dart';
import 'package:flutter_base/clean_architecture/domain/repository/day_repository_interface.dart';
import '../../data/mappers/day_mapper.dart';

class DayRepository implements DayRepositoryInterface {
  final SunriseProviderInterface _provider;

  DayRepository(this._provider);

  @override
  Future<Day> getDay({required double latitude, required double longitude}) async {
     var day = await _provider.getDay(latitude: latitude, longitude: longitude);

     return day.toEntity();
  }
}