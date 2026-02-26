import 'package:dio/dio.dart';
import '../models/sensei_model.dart';

class SenseiRepository {
  final Dio _dio;

  SenseiRepository({required Dio dio}) : _dio = dio;

  Future<ChatMessage> chat({
    required String message,
    required List<Map<String, String>> history,
  }) async {
    try {
      final response = await _dio.post('/api/agents/sensei/chat', data: {
        'message': message,
        'history': history,
      });
      return ChatMessage(
        role: ChatMessageRole.assistant,
        content: response.data['data']['text'] as String,
      );
    } catch (e) {
      throw Exception('AI Sensei chat failed: $e');
    }
  }

  Future<GrammarCorrection> checkGrammar({required String text}) async {
    try {
      final response = await _dio.post('/api/agents/sensei/grammar-check', data: {'text': text});
      return GrammarCorrection.fromJson(response.data);
    } catch (e) {
      throw Exception('Grammar check failed: $e');
    }
  }

  Future<String> translate({
    required String text,
    String sourceLanguage = 'auto',
    String targetLanguage = 'vi',
  }) async {
     try {
      final response = await _dio.post('/api/agents/sensei/translate', data: {
        'text': text,
        'sourceLanguage': sourceLanguage,
        'targetLanguage': targetLanguage,
      });
      return response.data['data']['text'] as String;
    } catch (e) {
      throw Exception('Translation failed: $e');
    }
  }

  Future<RoleplayMessage> roleplay({
    required String topic,
    required String message,
    required List<Map<String, String>> history,
  }) async {
    try {
      final response = await _dio.post('/api/agents/sensei/roleplay', data: {
        'topic': topic,
        'message': message,
        'history': history,
      });
       final responseData = response.data['data'];
       return RoleplayMessage(
         role: ChatMessageRole.assistant,
         content: responseData['text'] as String,
         audioUrl: responseData['audioUrl'] as String?,
       );
    } catch (e) {
      throw Exception('AI Roleplay failed: $e');
    }
  }

  // TODO: Add other methods like generateDrill if needed
}
