import 'package:dio/dio.dart';
import '../models/agent_models.dart';

class AgentRepository {
  final Dio _dio;

  AgentRepository({required Dio dio}) : _dio = dio;

  Future<RoleplayResponse> roleplay({
    required String topic,
    required String message,
    List<Map<String, dynamic>> history = const [],
    bool isFinal = false,
  }) async {
    try {
      final response = await _dio.post(
        '/api/agents/roleplay',
        data: {
          'topic': topic,
          'message': message,
          'history': history,
          'isFinal': isFinal,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data;
        if (data['success'] == true) {
          return RoleplayResponse.fromJson(data['data']);
        }
      }
      throw Exception('Failed to process roleplay: ${response.data['message'] ?? 'Unknown error'}');
    } catch (e) {
      throw Exception('Failed to process roleplay: $e');
    }
  }

  Future<TTSResponse> getTTS(String text, {String? voice}) async {
    try {
      final response = await _dio.post(
        '/api/agents/tts',
        data: {
          'text': text,
          if (voice != null) 'voice': voice,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data;
        if (data['success'] == true) {
          return TTSResponse.fromJson(data['data']);
        }
      }
      throw Exception('Failed to generate TTS');
    } catch (e) {
      throw Exception('Failed to generate TTS: $e');
    }
  }
}
