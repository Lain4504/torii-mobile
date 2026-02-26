import 'package:torii_app/data/api/api_client.dart';
import 'package:torii_app/core/models/api_response.dart';
import '../models/placement_test_model.dart';

class AssessmentRepository {
  final ApiClient _apiClient;

  AssessmentRepository(this._apiClient);

  Future<PlacementTest?> generatePlacementTest(int questionCount) async {
    try {
      final response = await _apiClient.client.post(
        '/api/agents/placement/test',
        data: {'questionCount': questionCount},
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);
      if (apiResponse.success && apiResponse.data != null) {
        return PlacementTest.fromJson(apiResponse.data!);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<PlacementEvaluation?> evaluatePlacementTest(String testId, Map<String, String> userAnswers) async {
    try {
      final response = await _apiClient.client.post(
        '/api/agents/placement/evaluate',
        data: {
          'testId': testId,
          'userAnswers': userAnswers,
        },
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);
      if (apiResponse.success && apiResponse.data != null) {
        return PlacementEvaluation.fromJson(apiResponse.data!);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
