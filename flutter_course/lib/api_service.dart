
import 'package:dio/dio.dart';
import 'models/movie_model.dart';
import 'models/review_model.dart';
import 'models/api_model.dart';


const _baseUrl = 'https://api.kinopoisk.dev';
const _apiKey = 'ZQQ8GMN-TN54SGK-NB3MKEC-ZKB8V06';

abstract class ApiService {
  Future<ApiModel<List<Docs>?, Failure>> getMovies();
  Future<ApiModel<List<ReviewDocs>?, Failure>> getReviews(int movieId);
}



class ApiServiceDio implements ApiService {
  static final ApiServiceDio _instance = ApiServiceDio._();

  ApiServiceDio._();

  static ApiServiceDio get instance => _instance;

  final Dio dio = Dio()..options.baseUrl = _baseUrl;

  @override
  Future<ApiModel<List<Docs>?, Failure>> getMovies() async {
    try {
      final response = await dio.get('/movie?field=rating.kp&search=5-10&field=year&search=2021-2022&field=typeNumber&search=1&sortField=year&sortType=1&sortField=votes.imdb&sortType=-1&token=$_apiKey');

      final list = response.data['docs'] as List<dynamic>;

      final models = list.map((e) => Docs.fromJson(e));

      return ApiModel.success(models.toList());
    } catch (e) {
      return ApiModel.error(Failure());
    }
  }

  @override
  Future<ApiModel<List<ReviewDocs>?, Failure>> getReviews(int movieId) async {
    try {
      final response = await dio.get('/review?field=movieId&search=$movieId&&token=$_apiKey');

      final list = response.data['docs'] as List<dynamic>;

      final models = list.map((e) => ReviewDocs.fromJson(e));

      return ApiModel.success(models.toList());
    } catch (e) {
      return ApiModel.error(Failure());
    }
  }

}
