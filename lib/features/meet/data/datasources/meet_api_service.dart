import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/config/app_config.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';
import 'package:torii_app/services/auth/token_service.dart';

final meetApiServiceProvider = Provider<MeetApiService>((ref) {
  final tokenService = ref.watch(tokenServiceProvider);
  return MeetApiService(tokenService);
});

class MeetApiService {
  final TokenService _tokenService;
  late final Dio _dio;
  String? _currentToken;

  MeetApiService(this._tokenService) {
    _dio = Dio(BaseOptions(
      baseUrl: '${AppConfig.apiBaseUrl}/api',
      contentType: 'application/protobuf',
      responseType: ResponseType.bytes,
    ));

    // Add interceptor for Authorization header
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _tokenService.getAccessToken();
        _currentToken = token;
        if (token != null) {
          options.headers['Authorization'] = token;
        }
        return handler.next(options);
      },
    ));

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }
  }

  String? get token => _currentToken;

  Future<VerifyTokenRes> verifyToken({bool isProduction = false}) async {
    try {
      final req = VerifyTokenReq(isProduction: isProduction);
      final response = await _dio.post(
        '/verifyToken',
        data: req.writeToBuffer(),
      );

      return VerifyTokenRes.fromBuffer(response.data as List<int>);
    } on DioException catch (e) {
      // Return a failed response or rethrow
      return VerifyTokenRes(
        status: false,
        msg: e.message ?? 'Unknown error',
      );
    } catch (e) {
      return VerifyTokenRes(
        status: false,
        msg: e.toString(),
      );
    }
  }

  // Add more API methods as needed (muteAll, endMeeting, etc.)
  // These usually follow the same pattern: 
  // 1. Create Proto request
  // 2. POST to endpoint
  // 3. Decode Proto response
}
