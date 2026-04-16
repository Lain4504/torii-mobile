import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/api/api_client.dart';
import '../../core/models/api_response.dart';
import '../../features/auth/providers/auth_providers.dart';

final onboardingServiceProvider = Provider<OnboardingService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return OnboardingService(apiClient);
});

class OnboardingService {
  final ApiClient _apiClient;

  OnboardingService(this._apiClient);

  Future<ApiResponse<void>> saveSurvey({
    required String jlptTarget,
    String? currentLevel,
  }) async {
    try {
      final response = await _apiClient.client.post(
        '/api/onboarding/survey',
        data: {
          'jlptTarget': jlptTarget,
          'currentLevel': currentLevel,
        },
        options: Options(headers: {'x-platform': 'mobile'}),
      );
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
  }

  ApiResponse<T> _handleError<T>(DioException e) {
    if (e.response?.data != null && e.response?.data is Map) {
      return ApiResponse.fromJson(e.response!.data, (_) => null as T);
    }
    return ApiResponse(
      success: false,
      message: e.message ?? 'Unknown error occurred',
    );
  }
}
