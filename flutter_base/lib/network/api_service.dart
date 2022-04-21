import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_base/network/models/api_model.dart';
import 'package:flutter_base/network/models/post_model.dart';
import 'package:http/http.dart' as http;

const _baseUrl = 'https://jsonplaceholder.typicode.com';

abstract class ApiService {
  Future<ApiModel<List<PostModel>, Failure>> getPosts();
}

class ApiServiceImpl implements ApiService {
  static final ApiServiceImpl _instance = ApiServiceImpl._();

  ApiServiceImpl._();

  static ApiServiceImpl get instance => _instance;

  @override
  Future<ApiModel<List<PostModel>, Failure>> getPosts() async {
    try {
      final url = Uri.parse(_baseUrl + '/posts');
      final response = await http.get(url);
      if (response.statusCode != 200) {
        ApiModel.error(Failure());
      }
      await Future.delayed(const Duration(seconds: 1));
      final now = DateTime.now();
      final List<dynamic> json = jsonDecode(response.body);
      final models = json.map((e) => PostModel.fromJson(e));

      print(DateTime.now().difference(now).inMilliseconds);

      return ApiModel.success(models.toList());
    } catch (e) {
      return ApiModel.error(Failure());
    }
  }
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
}
