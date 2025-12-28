import 'package:dio/dio.dart';

import '../../core/config/app_config.dart';

class ApiClient {
  ApiClient({Dio? dio}) : _dio = dio ?? Dio(BaseOptions(baseUrl: AppConfig.apiBaseUrl));

  final Dio _dio;

  Dio get client => _dio;
}

