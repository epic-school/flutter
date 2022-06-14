import 'package:dio/dio.dart';
import 'package:flutter_base/clean_architecture/data/models/api_day.dart';
import 'package:flutter_base/clean_architecture/data/providers/sunrise_provider_interface.dart';

class SunriseProvider implements SunriseProviderInterface {
  static const BASE_URL = "https://api.sunrise-sunset.org";

  final Dio _dio = Dio(BaseOptions(baseUrl: BASE_URL));

  @override
  Future<ApiDay> getDay({required double latitude, required double longitude}) async {
    final query = {'lat': latitude, 'lon': longitude};
    final response = await _dio.get('/json', queryParameters: query);

    return ApiDay.fromApi(response.data);
  }
}