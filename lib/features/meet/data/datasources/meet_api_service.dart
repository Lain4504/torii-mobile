import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:torii_app/core/config/app_config.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_breakout_room.pb.dart' as breakout_room;
import 'package:torii_app/features/meet/data/models/proto/wajlc_insights.pb.dart' as insights;
import 'package:torii_app/features/meet/data/models/proto/wajlc_polls.pb.dart' as polls;
import 'package:torii_app/services/auth/token_service.dart';

final meetApiServiceProvider = Provider<MeetApiService>((ref) {
  final tokenService = ref.watch(tokenServiceProvider);
  return MeetApiService(tokenService);
});

/// Exception thrown when Meet API operations fail
class MeetApiException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  MeetApiException(this.message, {this.code, this.originalError});

  @override
  String toString() => 'MeetApiException: $message${code != null ? ' (code: $code)' : ''}';
}

class MeetApiService {
  final TokenService _tokenService;
  late final Dio _dio;
  String? _currentToken;
  String? _manualToken;

  /// Web client sends raw JWT; set true if gateway/proxy expect "Bearer token".
  static const bool _useBearerPrefix = false;

  /// Maximum number of retry attempts for failed requests
  static const int _maxRetries = 3;

  /// Delay between retry attempts (in milliseconds)
  static const int _retryDelayMs = 1000;

  MeetApiService(this._tokenService) {
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      contentType: 'application/protobuf',
      responseType: ResponseType.bytes,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    // Add interceptor for Authorization header
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token;
        if (_manualToken != null) {
          token = _manualToken;
          _currentToken = _manualToken;
        } else {
          token = await _tokenService.getAccessToken();
          _currentToken = token;
        }
        if (token != null) {
          options.headers['Authorization'] = _useBearerPrefix ? 'Bearer $token' : token;
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        // Log errors in debug mode
        if (kDebugMode) {
          print('Meet API Error: ${error.message}');
          print('Request: ${error.requestOptions.method} ${error.requestOptions.path}');
          if (error.response != null) {
            print('Response: ${error.response?.statusCode} ${error.response?.data}');
          }
        }
        return handler.next(error);
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

  void setManualToken(String? token) {
    _manualToken = token;
  }

  /// Helper to handle Dio errors and convert to MeetApiException
  MeetApiException _handleDioError(DioException error, String operation) {
    String message;
    String? code;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        message = 'Connection timeout. Please check your internet connection.';
        code = 'TIMEOUT';
        break;
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        message = 'Server error ($statusCode) during $operation';
        code = 'HTTP_$statusCode';
        break;
      case DioExceptionType.cancel:
        message = 'Request was cancelled';
        code = 'CANCELLED';
        break;
      case DioExceptionType.connectionError:
        message = 'No internet connection';
        code = 'NO_CONNECTION';
        break;
      default:
        message = error.message ?? 'Unknown error during $operation';
        code = 'UNKNOWN';
    }

    return MeetApiException(message, code: code, originalError: error);
  }

  /// Generic protobuf POST with error handling and retry logic
  Future<T> _postProto<T extends $pb.GeneratedMessage>({
    required String path,
    required $pb.GeneratedMessage request,
    required T Function(List<int> bytes) fromBuffer,
    int retryCount = 0,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: request.writeToBuffer(),
      );
      return fromBuffer(response.data as List<int>);
    } on DioException catch (e) {
      // Retry on timeout or connection errors
      if (retryCount < _maxRetries && _shouldRetry(e)) {
        if (kDebugMode) debugPrint('Retrying $path (attempt ${retryCount + 1}/$_maxRetries)');
        await Future.delayed(Duration(milliseconds: _retryDelayMs * (retryCount + 1)));
        return _postProto(
          path: path,
          request: request,
          fromBuffer: fromBuffer,
          retryCount: retryCount + 1,
        );
      }
      throw _handleDioError(e, path);
    } catch (e) {
      throw MeetApiException('Failed to process $path: ${e.toString()}', originalError: e);
    }
  }

  /// Determine if a request should be retried
  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError;
  }

  /// Validate CommonResponse and throw if not successful
  void _validateCommonResponse(CommonResponse response, String operation) {
    if (!response.status) {
      throw MeetApiException(
        response.msg.isNotEmpty ? response.msg : 'Operation failed: $operation',
        code: 'OPERATION_FAILED',
      );
    }
  }

  /// Validate PollResponse and throw if not successful
  void _validatePollResponse(polls.PollResponse response, String operation) {
    if (!response.status) {
      throw MeetApiException(
        response.msg.isNotEmpty ? response.msg : 'Poll operation failed: $operation',
        code: 'POLL_OPERATION_FAILED',
      );
    }
  }

  // --- Token Verification ---

  Future<VerifyTokenRes> verifyToken({bool isProduction = false}) async {
    try {
      final req = VerifyTokenReq(isProduction: isProduction);
      final response = await _dio.post(
        '/api/verifyToken',
        data: req.writeToBuffer(),
      );

      final result = VerifyTokenRes.fromBuffer(response.data as List<int>);
      
      // Log verification result in debug mode
      if (kDebugMode && result.status) {
        print('Token verified: roomId=${result.roomId}, userId=${result.userId}');
      }
      
      return result;
    } on DioException catch (e) {
      if (kDebugMode) print('verifyToken DioException: ${e.message}');
      return VerifyTokenRes(
        status: false,
        msg: e.response?.statusCode == 401 
            ? 'Invalid or expired token' 
            : (e.message ?? 'Token verification failed'),
      );
    } catch (e) {
      if (kDebugMode) print('verifyToken error: $e');
      return VerifyTokenRes(status: false, msg: 'Token verification failed: ${e.toString()}');
    }
  }

  // --- Auth & Room Management (JSON based to match Web) ---

  Future<String> _getHashSignature(String message) async {
    final key = utf8.encode(AppConfig.meetApiSecret);
    final bytes = utf8.encode(message);
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    return digest.toString();
  }

  /// Auth room endpoints expect JSON with snake_case keys
  Future<Map<String, dynamic>> _sendAuthRequest(
    String method,
    Map<String, dynamic> body, {
    int retryCount = 0,
  }) async {
    try {
      final jsonBody = jsonEncode(body);
      final signature = await _getHashSignature(jsonBody);

      final response = await _dio.post(
        '/auth/$method',
        data: jsonBody,
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
          headers: {
            'API-KEY': AppConfig.meetApiKey,
            'HASH-SIGNATURE': signature,
          },
        ),
      );

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      // Retry on timeout or connection errors
      if (retryCount < _maxRetries && _shouldRetry(e)) {
        if (kDebugMode) print('Retrying /auth/$method (attempt ${retryCount + 1}/$_maxRetries)');
        await Future.delayed(Duration(milliseconds: _retryDelayMs * (retryCount + 1)));
        return _sendAuthRequest(method, body, retryCount: retryCount + 1);
      }
      throw _handleDioError(e, '/auth/$method');
    } catch (e) {
      throw MeetApiException('Auth request failed: $method', originalError: e);
    }
  }

  Future<bool> isRoomActive(String roomId) async {
    try {
      final data = await _sendAuthRequest('room/isRoomActive', {'room_id': roomId});
      return data['is_active'] == true;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      if (kDebugMode) print('isRoomActive error: $e');
      throw MeetApiException('Failed to check room status', originalError: e);
    }
  }

  Future<bool> createRoom(String roomId) async {
    try {
      final body = {
        'roomId': roomId,
        'emptyTimeout': 7200,
        'metadata': {
          'roomTitle': 'Mobile Meeting',
          'welcomeMessage': 'Welcome from Torii Mobile!',
          'roomFeatures': {
            'allowWebcams': true,
            'muteOnStart': false,
            'allowScreenShare': true,
            'allowRaiseHand': true,
            'chatFeatures': {'isAllow': true},
          }
        }
      };
      final data = await _sendAuthRequest('room/create', body);
      
      if (data['status'] != true) {
        throw MeetApiException(
          data['msg']?.toString() ?? 'Failed to create room',
          code: 'CREATE_ROOM_FAILED',
        );
      }
      
      return true;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      if (kDebugMode) print('createRoom error: $e');
      throw MeetApiException('Failed to create room', originalError: e);
    }
  }

  Future<String?> getJoinToken({
    required String roomId,
    required String name,
    required String userId,
    bool isAdmin = false,
  }) async {
    try {
      final body = {
        'room_id': roomId,
        'user_info': {
          'is_admin': isAdmin,
          'name': name,
          'user_id': userId,
          'user_metadata': {
            'extra_data': {'client': 'mobile'},
          },
        }
      };
      final data = await _sendAuthRequest('room/getJoinToken', body);
      
      if (data['status'] != true) {
        throw MeetApiException(
          data['msg']?.toString() ?? 'Failed to get join token',
          code: 'GET_TOKEN_FAILED',
        );
      }
      
      return data['token'] as String?;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      if (kDebugMode) print('getJoinToken error: $e');
      throw MeetApiException('Failed to get join token', originalError: e);
    }
  }

  // --- Polls (protobuf, /api/polls/*) ---

  Future<polls.PollResponse> listPolls() async {
    try {
      final response = await _dio.get('/api/polls/listPolls');
      final result = polls.PollResponse.fromBuffer(response.data as List<int>);
      _validatePollResponse(result, 'listPolls');
      return result;
    } on DioException catch (e) {
      throw _handleDioError(e, 'listPolls');
    } catch (e) {
      if (e is MeetApiException) rethrow;
      throw MeetApiException('Failed to list polls', originalError: e);
    }
  }

  Future<polls.PollResponse> createPoll(polls.CreatePollReq req) async {
    try {
      final result = await _postProto(
        path: '/api/polls/create',
        request: req,
        fromBuffer: (bytes) => polls.PollResponse.fromBuffer(bytes),
      );
      _validatePollResponse(result, 'createPoll');
      return result;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      throw MeetApiException('Failed to create poll', originalError: e);
    }
  }

  Future<polls.PollResponse> submitPollResponse(polls.SubmitPollResponseReq req) async {
    try {
      final result = await _postProto(
        path: '/api/polls/submitResponse',
        request: req,
        fromBuffer: (bytes) => polls.PollResponse.fromBuffer(bytes),
      );
      _validatePollResponse(result, 'submitPollResponse');
      return result;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      throw MeetApiException('Failed to submit poll response', originalError: e);
    }
  }

  Future<polls.PollResponse> closePoll({
    required String pollId,
    required String roomId,
    required String userId,
  }) async {
    try {
      final req = polls.ClosePollReq(
        roomId: roomId,
        userId: userId,
        pollId: pollId,
      );
      final result = await _postProto(
        path: '/api/polls/closePoll',
        request: req,
        fromBuffer: (bytes) => polls.PollResponse.fromBuffer(bytes),
      );
      _validatePollResponse(result, 'closePoll');
      return result;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      throw MeetApiException('Failed to close poll', originalError: e);
    }
  }

  /// Get user's selected option for a poll
  Future<polls.PollResponse> getUserSelectedOption({
    required String pollId,
    required String userId,
  }) async {
    try {
      final response = await _dio.get('/api/polls/userSelectedOption/$pollId/$userId');
      final result = polls.PollResponse.fromBuffer(response.data as List<int>);
      return result;
    } on DioException catch (e) {
      throw _handleDioError(e, 'getUserSelectedOption');
    } catch (e) {
      if (e is MeetApiException) rethrow;
      throw MeetApiException('Failed to get user selected option', originalError: e);
    }
  }

  /// Get poll responses details (admin only)
  Future<polls.PollResponse> getPollResponsesDetails(String pollId) async {
    try {
      final response = await _dio.get('/api/polls/pollResponsesDetails/$pollId');
      final result = polls.PollResponse.fromBuffer(response.data as List<int>);
      return result;
    } on DioException catch (e) {
      throw _handleDioError(e, 'getPollResponsesDetails');
    } catch (e) {
      if (e is MeetApiException) rethrow;
      throw MeetApiException('Failed to get poll responses details', originalError: e);
    }
  }

  /// Get poll responses result (public results after poll closes)
  Future<polls.PollResponse> getPollResponsesResult(String pollId) async {
    try {
      final response = await _dio.get('/api/polls/pollResponsesResult/$pollId');
      final result = polls.PollResponse.fromBuffer(response.data as List<int>);
      return result;
    } on DioException catch (e) {
      throw _handleDioError(e, 'getPollResponsesResult');
    } catch (e) {
      if (e is MeetApiException) rethrow;
      throw MeetApiException('Failed to get poll responses result', originalError: e);
    }
  }

  // --- Waiting room (protobuf, /api/waitingRoom/*) ---

  Future<CommonResponse> approveWaitingUsers(ApproveWaitingUsersReq req) async {
    try {
      final result = await _postProto(
        path: '/api/waitingRoom/approveUsers',
        request: req,
        fromBuffer: (bytes) => CommonResponse.fromBuffer(bytes),
      );
      _validateCommonResponse(result, 'approveWaitingUsers');
      return result;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      throw MeetApiException('Failed to approve waiting users', originalError: e);
    }
  }

  Future<CommonResponse> updateWaitingRoomMessage(UpdateWaitingRoomMessageReq req) async {
    try {
      final result = await _postProto(
        path: '/api/waitingRoom/updateMsg',
        request: req,
        fromBuffer: (bytes) => CommonResponse.fromBuffer(bytes),
      );
      _validateCommonResponse(result, 'updateWaitingRoomMessage');
      return result;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      throw MeetApiException('Failed to update waiting room message', originalError: e);
    }
  }

  // --- Participant controls (protobuf, /api/*) ---

  Future<CommonResponse> updateUserLockSettings(UpdateUserLockSettingsReq req) async {
    try {
      final result = await _postProto(
        path: '/api/updateLockSettings',
        request: req,
        fromBuffer: (bytes) => CommonResponse.fromBuffer(bytes),
      );
      _validateCommonResponse(result, 'updateUserLockSettings');
      return result;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      throw MeetApiException('Failed to update lock settings', originalError: e);
    }
  }

  Future<CommonResponse> muteUnmuteTrack(MuteUnMuteTrackReq req) async {
    try {
      final result = await _postProto(
        path: '/api/muteUnmuteTrack',
        request: req,
        fromBuffer: (bytes) => CommonResponse.fromBuffer(bytes),
      );
      _validateCommonResponse(result, 'muteUnmuteTrack');
      return result;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      throw MeetApiException('Failed to mute/unmute track', originalError: e);
    }
  }

  Future<CommonResponse> removeParticipant(RemoveParticipantReq req) async {
    try {
      final result = await _postProto(
        path: '/api/removeParticipant',
        request: req,
        fromBuffer: (bytes) => CommonResponse.fromBuffer(bytes),
      );
      _validateCommonResponse(result, 'removeParticipant');
      return result;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      throw MeetApiException('Failed to remove participant', originalError: e);
    }
  }

  Future<CommonResponse> switchPresenter(SwitchPresenterReq req) async {
    try {
      final result = await _postProto(
        path: '/api/switchPresenter',
        request: req,
        fromBuffer: (bytes) => CommonResponse.fromBuffer(bytes),
      );
      _validateCommonResponse(result, 'switchPresenter');
      return result;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      throw MeetApiException('Failed to switch presenter', originalError: e);
    }
  }

  // --- File upload (protobuf, /api/uploadBase64EncodedData) ---

  /// Upload file as base64 (for chat). Returns filePath and fileName on success.
  Future<UploadBase64EncodedDataRes> uploadBase64EncodedFile({
    required String roomId,
    required String fileName,
    required String base64Data,
    required RoomUploadedFileType fileType,
  }) async {
    try {
      final req = UploadBase64EncodedDataReq(
        roomId: roomId,
        data: base64Data,
        fileName: fileName,
        fileType: fileType,
      );
      final result = await _postProto(
        path: '/api/uploadBase64EncodedData',
        request: req,
        fromBuffer: (bytes) => UploadBase64EncodedDataRes.fromBuffer(bytes),
      );
      return result;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      throw MeetApiException('Failed to upload file', originalError: e);
    }
  }

  // --- Insights AI (protobuf, /api/insights/*) ---

  /// Execute Insights AI text chat (user message). Server streams response via NATS RESP_INSIGHTS_AI_TEXT_CHAT.
  Future<CommonResponse> executeInsightsAiTextChat(String text) async {
    try {
      final req = insights.InsightsAITextChatContent(
        role: insights.InsightsAITextChatRole.INSIGHTS_AI_TEXT_CHAT_ROLE_USER,
        text: text,
      );
      final result = await _postProto(
        path: '/api/insights/ai/textChat/execute',
        request: req,
        fromBuffer: (bytes) => CommonResponse.fromBuffer(bytes),
      );
      return result;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      throw MeetApiException('Failed to execute Insights AI text chat', originalError: e);
    }
  }

  // --- Breakout room (protobuf, /api/breakoutRoom/*) ---

  /// Join a breakout room (matches web useJoinRoomMutation).
  /// Returns response with status, msg, and token to join the breakout room.
  Future<breakout_room.BreakoutRoomRes> joinBreakoutRoom({
    required String breakoutRoomId,
    required String userId,
    String? roomId,
    bool isAdmin = false,
  }) async {
    try {
      final req = breakout_room.JoinBreakoutRoomReq(
        breakoutRoomId: breakoutRoomId,
        userId: userId,
        roomId: roomId ?? '',
        isAdmin: isAdmin,
      );
      final result = await _postProto(
        path: '/api/breakoutRoom/join',
        request: req,
        fromBuffer: (bytes) => breakout_room.BreakoutRoomRes.fromBuffer(bytes),
      );
      return result;
    } on MeetApiException {
      rethrow;
    } catch (e) {
      throw MeetApiException('Failed to join breakout room', originalError: e);
    }
  }
}
