import 'package:flutter_base/clean_architecture/data/models/api_day.dart';

abstract class SunriseProviderInterface {
  Future<ApiDay> getDay({required double latitude, required double longitude});
}