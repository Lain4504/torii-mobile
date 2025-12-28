import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';
import 'api_exception.dart';

/// HTTP client wrapper for API calls
class ApiClient {
  final String baseUrl;
  String? _token;

  ApiClient({String? baseUrl})
      : baseUrl = baseUrl ?? AppConfig.baseUrl;

  /// Set authentication token
  void setToken(String? token) {
    _token = token;
  }

  /// Get authentication token
  String? getToken() => _token;

  /// Clear authentication token
  void clearToken() {
    _token = null;
  }

  /// Get default headers
  Map<String, String> _getHeaders({Map<String, String>? additionalHeaders}) {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (_token != null) {
      headers['Authorization'] = 'Bearer $_token';
    }

    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    return headers;
  }

  /// Handle HTTP errors
  void _handleError(http.Response response) {
    final statusCode = response.statusCode;
    String message;

    try {
      final body = json.decode(response.body);
      message = body['message'] ?? body['error'] ?? 'An error occurred';
    } catch (e) {
      message = 'An error occurred';
    }

    switch (statusCode) {
      case 400:
        throw ValidationException(message: message, statusCode: statusCode);
      case 401:
        throw UnauthorizedException(message: message, statusCode: statusCode);
      case 404:
        throw NotFoundException(message: message, statusCode: statusCode);
      case 500:
      case 502:
      case 503:
        throw ServerException(message: message, statusCode: statusCode);
      default:
        throw ApiException(
          message: message,
          statusCode: statusCode,
        );
    }
  }

  /// GET request
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    try {
      var uri = Uri.parse('$baseUrl$endpoint');
      
      if (queryParameters != null && queryParameters.isNotEmpty) {
        uri = uri.replace(queryParameters: queryParameters);
      }

      final response = await http
          .get(
            uri,
            headers: _getHeaders(additionalHeaders: headers),
          )
          .timeout(AppConfig.receiveTimeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        _handleError(response);
        throw ApiException(message: 'Request failed');
      }
    } on http.ClientException catch (e) {
      throw NetworkException(
        message: 'Network error: ${e.message}',
        originalError: e,
      );
    } on ApiException {
      rethrow;
    } catch (e) {
      throw NetworkException(
        message: 'Unexpected error: ${e.toString()}',
        originalError: e,
      );
    }
  }

  /// POST request
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      
      final response = await http
          .post(
            uri,
            headers: _getHeaders(additionalHeaders: headers),
            body: body != null ? json.encode(body) : null,
          )
          .timeout(AppConfig.receiveTimeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (response.body.isEmpty) {
          return {};
        }
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        _handleError(response);
        throw ApiException(message: 'Request failed');
      }
    } on http.ClientException catch (e) {
      throw NetworkException(
        message: 'Network error: ${e.message}',
        originalError: e,
      );
    } on ApiException {
      rethrow;
    } catch (e) {
      throw NetworkException(
        message: 'Unexpected error: ${e.toString()}',
        originalError: e,
      );
    }
  }

  /// PUT request
  Future<Map<String, dynamic>> put(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      
      final response = await http
          .put(
            uri,
            headers: _getHeaders(additionalHeaders: headers),
            body: body != null ? json.encode(body) : null,
          )
          .timeout(AppConfig.receiveTimeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (response.body.isEmpty) {
          return {};
        }
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        _handleError(response);
        throw ApiException(message: 'Request failed');
      }
    } on http.ClientException catch (e) {
      throw NetworkException(
        message: 'Network error: ${e.message}',
        originalError: e,
      );
    } on ApiException {
      rethrow;
    } catch (e) {
      throw NetworkException(
        message: 'Unexpected error: ${e.toString()}',
        originalError: e,
      );
    }
  }

  /// DELETE request
  Future<Map<String, dynamic>> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      
      final response = await http
          .delete(
            uri,
            headers: _getHeaders(additionalHeaders: headers),
          )
          .timeout(AppConfig.receiveTimeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (response.body.isEmpty) {
          return {};
        }
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        _handleError(response);
        throw ApiException(message: 'Request failed');
      }
    } on http.ClientException catch (e) {
      throw NetworkException(
        message: 'Network error: ${e.message}',
        originalError: e,
      );
    } on ApiException {
      rethrow;
    } catch (e) {
      throw NetworkException(
        message: 'Unexpected error: ${e.toString()}',
        originalError: e,
      );
    }
  }
}

