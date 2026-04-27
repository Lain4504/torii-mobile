import 'package:dio/dio.dart';
import '../../../core/models/api_response.dart';
import '../models/lesson_chat_dto.dart';
import '../models/sensei_model.dart';
import '../models/sensei_subscription_models.dart';

class SenseiQuotaExceededException implements Exception {
  final String message;

  const SenseiQuotaExceededException(this.message);

  @override
  String toString() => message;
}

class SenseiRepository {
  final Dio _dio;

  SenseiRepository({required Dio dio}) : _dio = dio;

  bool _looksLikeQuotaExceeded(String message) {
    final m = message.toLowerCase();
    return m.contains('hết lượt') ||
        m.contains('het luot') ||
        m.contains('quota') ||
        m.contains('ai_turns') ||
        m.contains('remaining') ||
        (m.contains('out of') && m.contains('turn'));
  }

  String _extractErrorMessage(dynamic error) {
    if (error is DioException) {
      final data = error.response?.data;
      if (data is Map<String, dynamic>) {
        final msg = data['message'] ?? data['error'] ?? data['detail'] ?? data['errors'];
        if (msg is String) return msg;
        if (msg is List) return msg.join(', ');
        return data.toString();
      }
      return error.message ?? error.toString();
    }
    return error.toString();
  }

  // --- SUBSCRIPTION API ---
  Future<List<SenseiSubscriptionPlan>> getSubscriptionPlans() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/agents/sensei/subscription-plans',
    );
    final body = response.data ?? {};
    if (body['success'] != true) return [];

    final data = body['data'];
    if (data is! List) return [];

    return data
        .whereType<Map>()
        .map((e) => SenseiSubscriptionPlan.fromJson(e.cast<String, dynamic>()))
        .toList();
  }

  Future<SenseiQuotaStatus> getQuotaStatus() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/agents/sensei/quota-status',
    );
    final body = response.data ?? {};
    if (body['success'] != true) {
      throw Exception(body['message'] ?? 'Failed to fetch quota status');
    }

    final data = body['data'];
    if (data is Map<String, dynamic>) {
      return SenseiQuotaStatus.fromJson(data);
    }
    if (data is Map) {
      return SenseiQuotaStatus.fromJson(data.cast<String, dynamic>());
    }
    throw Exception('Unexpected quota-status response');
  }

  Future<SenseiSubscriptionCheckoutResult> checkoutSubscriptionPlan({
    required List<String> subscriptionPlanIds,
    required String paymentMethod,
    required String description,
    bool useWalletBalance = false,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/academy/orders/checkout',
        data: <String, dynamic>{
          'subscriptionPlanIds': subscriptionPlanIds,
          'paymentMethod': paymentMethod.toUpperCase(),
          'description': description,
          'useWalletBalance': useWalletBalance,
        },
      );
      final body = response.data ?? {};
      if (body['success'] != true) {
        throw Exception(body['message'] ?? 'Failed to checkout subscription');
      }

      final data = body['data'];
      if (data is Map<String, dynamic>) {
        return SenseiSubscriptionCheckoutResult.fromJson(data);
      }
      if (data is Map) {
        return SenseiSubscriptionCheckoutResult.fromJson(data.cast<String, dynamic>());
      }
      throw Exception('Unexpected checkout response');
    } catch (e) {
      throw Exception(_extractErrorMessage(e));
    }
  }

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
      final data = response.data?['data'];
      return ChatMessage(
        role: ChatMessageRole.assistant,
        content: (data?['message'] ?? '').toString(),
        suggestions: data?['suggestions'] != null 
            ? List<String>.from(data['suggestions']) 
            : null,
      );
    } catch (e) {
      final msg = _extractErrorMessage(e);
      if (_looksLikeQuotaExceeded(msg)) {
        throw SenseiQuotaExceededException(
          msg.isNotEmpty ? msg : 'Bạn đã hết lượt sử dụng.',
        );
      }
      throw Exception('AI Sensei chat failed: $msg');
    }
  }

  Future<ApiResponse<LessonChatDataDTO>> sendLessonChat({
    required String lessonId,
    String? courseId,
    String? currentTimestamp,
    required String message,
    List<Map<String, String>> history = const [],
  }) async {
    try {
      final response = await _dio.post(
        '/api/agents/lesson/chat',
        data: {
          'lessonId': lessonId,
          'courseId': courseId,
          'currentTimestamp': currentTimestamp,
          'message': message,
          'history': history,
        },
      );

      return ApiResponse.fromJson(
        response.data,
        (dataJson) => LessonChatDataDTO.fromJson(dataJson as Map<String, dynamic>),
      );
    } catch (e) {
      final msg = _extractErrorMessage(e);
      if (_looksLikeQuotaExceeded(msg)) {
        throw SenseiQuotaExceededException(
          msg.isNotEmpty ? msg : 'Bạn đã hết lượt sử dụng.',
        );
      }
      return ApiResponse(success: false, message: 'Lỗi kết nối: $msg');
    }
  }

  Future<FlashcardAutofillModel> autofillFlashcard({required String term}) async {
    try {
      final response = await _dio.post('/api/agents/flashcard/autofill', data: {'term': term});
      final body = response.data ?? {};
      if (body['success'] != true) {
        throw Exception(body['message'] ?? 'AI Autofill failed');
      }
      return FlashcardAutofillModel.fromJson(body['data']);
    } catch (e) {
      final msg = _extractErrorMessage(e);
      if (_looksLikeQuotaExceeded(msg)) {
        throw SenseiQuotaExceededException(
          msg.isNotEmpty ? msg : 'Bạn đã hết lượt sử dụng.',
        );
      }
      throw Exception('Flashcard AI Autofill failed: $msg');
    }
  }

  Future<GrammarCheckResponse> checkGrammar({required String text}) async {
    try {
      final response = await _dio.post('/api/agents/grammar-check', data: {'text': text});
      return GrammarCheckResponse.fromJson(response.data);
    } catch (e) {
      final msg = _extractErrorMessage(e);
      if (_looksLikeQuotaExceeded(msg)) {
        throw SenseiQuotaExceededException(
          msg.isNotEmpty ? msg : 'Bạn đã hết lượt sử dụng.',
        );
      }
      throw Exception('Grammar check failed: $msg');
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
      final msg = _extractErrorMessage(e);
      if (_looksLikeQuotaExceeded(msg)) {
        throw SenseiQuotaExceededException(
          msg.isNotEmpty ? msg : 'Bạn đã hết lượt sử dụng.',
        );
      }
      throw Exception('Translation failed: $msg');
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
        final msg = (data['message'] ?? data['error'] ?? '').toString();
        if (_looksLikeQuotaExceeded(msg)) {
          throw SenseiQuotaExceededException(
            msg.isNotEmpty ? msg : 'Bạn đã hết lượt sử dụng.',
          );
        }
      }
      final msg = (response.data?['message'] ?? response.data?['error'] ?? 'Unknown error').toString();
      if (_looksLikeQuotaExceeded(msg)) {
        throw SenseiQuotaExceededException(
          msg.isNotEmpty ? msg : 'Bạn đã hết lượt sử dụng.',
        );
      }
      throw Exception('Failed to process roleplay: $msg');
    } catch (e) {
      final msg = _extractErrorMessage(e);
      if (_looksLikeQuotaExceeded(msg)) {
        throw SenseiQuotaExceededException(
          msg.isNotEmpty ? msg : 'Bạn đã hết lượt sử dụng.',
        );
      }
      throw Exception('Failed to process roleplay: $msg');
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
      final msg = _extractErrorMessage(e);
      if (_looksLikeQuotaExceeded(msg)) {
        throw SenseiQuotaExceededException(
          msg.isNotEmpty ? msg : 'Bạn đã hết lượt sử dụng.',
        );
      }
      throw Exception('Failed to generate TTS: $msg');
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
      final msg = (response.data?['message'] ?? response.data?['error'] ?? '').toString();
      if (_looksLikeQuotaExceeded(msg)) {
        throw SenseiQuotaExceededException(
          msg.isNotEmpty ? msg : 'Bạn đã hết lượt sử dụng.',
        );
      }
      throw Exception('Failed to get voice agent token: $msg');
    } catch (e) {
      final msg = _extractErrorMessage(e);
      if (_looksLikeQuotaExceeded(msg)) {
        throw SenseiQuotaExceededException(
          msg.isNotEmpty ? msg : 'Bạn đã hết lượt sử dụng.',
        );
      }
      throw Exception('Failed to get voice agent token: $msg');
    }
  }
}
