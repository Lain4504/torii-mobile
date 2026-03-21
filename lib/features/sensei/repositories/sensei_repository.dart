import 'package:dio/dio.dart';
import '../models/sensei_model.dart';

class SenseiRepository {
  final Dio _dio;

  SenseiRepository({required Dio dio}) : _dio = dio;

  // --- CHATBOT API ---

  Future<ChatMessage> chat({
    required String message,
    required List<Map<String, String>> history,
  }) async {
    try {
      final response = await _dio.post('/api/agents/chat', data: {
        'message': message,
        'history': history,
      });
      return ChatMessage(
        role: ChatMessageRole.assistant,
        content: (response.data?['data']?['message'] ?? '').toString(),
      );
    } catch (e) {
      throw Exception('AI Sensei chat failed: $e');
    }
  }

  Future<GrammarCheckResponse> checkGrammar({required String text}) async {
    try {
      final response = await _dio.post('/api/agents/grammar-check', data: {'text': text});
      return GrammarCheckResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Grammar check failed: $e');
    }
  }

  Future<TranslateResponse> translate({
    required String text,
    String sourceLanguage = 'auto',
    String targetLanguage = 'vi',
  }) async {
     try {
      final response = await _dio.post('/api/agents/translate', data: {
        'text': text,
        'sourceLanguage': sourceLanguage,
        'targetLanguage': targetLanguage,
      });
      return TranslateResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Translation failed: $e');
    }
  }

  // --- ROLEPLAY API (Merged from Agent) ---

  Future<RoleplayResponse> sendRoleplayMessage({
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
      throw Exception('Failed to process roleplay: ${response.data?['message'] ?? 'Unknown error'}');
    } catch (e) {
      throw Exception('Failed to process roleplay: $e');
    }
  }

  // --- TTS API ---

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

  // --- TOPICS ---

  Future<List<RoleplayTopic>> getRoleplayTopics() async {
    // Mocking topics for now as backend might not have a dedicated list endpoint yet
    // but we can define them based on what backend supports
    return [
      const RoleplayTopic(
        id: 'restaurant',
        title: 'Tại nhà hàng',
        description: 'Luyện tập gọi món và thanh toán tại nhà hàng Nhật.',
        level: 'N5',
        scenario: 'restaurant',
        icon: '🍱',
      ),
      const RoleplayTopic(
        id: 'shopping',
        title: 'Đi mua sắm',
        description: 'Hỏi giá, chọn đồ và mặc cả khi đi shopping.',
        level: 'N5',
        scenario: 'shopping',
        icon: '🛍️',
      ),
      const RoleplayTopic(
        id: 'office',
        title: 'Trong văn phòng',
        description: 'Chào hỏi đồng nghiệp và thảo luận công việc cơ bản.',
        level: 'N4',
        scenario: 'office',
        icon: '💼',
      ),
      const RoleplayTopic(
        id: 'casual',
        title: 'Tán gẫu bạn bè',
        description: 'Nói chuyện thân mật về sở thích và cuối tuần.',
        level: 'N4',
        scenario: 'casual',
        icon: '☕',
      ),
    ];
  }

  // --- VOICE AGENT API ---

  Future<Map<String, dynamic>> getLiveKitToken(String graphName) async {
    try {
      final response = await _dio.post(
        '/api/agents/livekit-token',
        data: {'graphName': graphName},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        if (data['success'] == true) {
          return data['data'];
        }
      }
      throw Exception('Failed to get voice agent token: ${response.data?['message']}');
    } catch (e) {
      throw Exception('Failed to get voice agent token: $e');
    }
  }
}
