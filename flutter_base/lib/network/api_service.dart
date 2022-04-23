
import 'package:dio/dio.dart';
import 'package:flutter_base/network/models/api_model.dart';
import 'package:flutter_base/network/models/post_model.dart';
import 'package:flutter_base/network/models/comment_model.dart';


const _baseUrl = 'https://jsonplaceholder.typicode.com';

abstract class ApiService {
  Future<ApiModel<List<PostModel>, Failure>> getPosts();
  Future<ApiModel<List<CommentModel>, Failure>> getComments(int postId);
}



class ApiServiceDio implements ApiService {
  static final ApiServiceDio _instance = ApiServiceDio._();

  ApiServiceDio._();

  static ApiServiceDio get instance => _instance;

  final Dio dio = Dio()..options.baseUrl = _baseUrl;

  @override
  Future<ApiModel<List<PostModel>, Failure>> getPosts() async {
    try {
      final response = await dio.get('/posts');

      final list = response.data as List<dynamic>;

      final models = list.map((e) => PostModel.fromJson(e));

      return ApiModel.success(models.toList());
    } catch (e) {
      return ApiModel.error(Failure());
    }
  }

  @override
  Future<ApiModel<List<CommentModel>, Failure>> getComments(int postId) async {

    try {
      final response = await dio.get('/comments?postId=$postId');

      final list = response.data as List<dynamic>;

      final models = list.map((e) => CommentModel.fromJson(e));

      return ApiModel.success(models.toList());
    } catch (e) {
      return ApiModel.error(Failure());
    }
  }
}
