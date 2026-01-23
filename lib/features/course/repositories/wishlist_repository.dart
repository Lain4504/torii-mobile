import 'package:dio/dio.dart';
import '../../../data/api/api_client.dart';

/// Repository for wishlist-related API calls
class WishlistRepository {
  final ApiClient _apiClient;

  WishlistRepository(this._apiClient);

  /// Check if course is in user's wishlist
  /// Returns true if in wishlist, false otherwise
  Future<bool> checkWishlist(String courseId) async {
    try {
      final response = await _apiClient.client.get(
        '/api/wishlists/check/$courseId',
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final dataMap = data is Map<String, dynamic> && data.containsKey('data')
            ? data['data'] as Map<String, dynamic>?
            : data as Map<String, dynamic>?;
        
        if (dataMap != null && dataMap.containsKey('isInWishlist')) {
          return dataMap['isInWishlist'] as bool? ?? false;
        }
        return false;
      } else {
        return false;
      }
    } on DioException catch (e) {
      // If 401, user is not authenticated - return false
      if (e.response?.statusCode == 401) {
        return false;
      }
      // For other errors, return false (assume not in wishlist)
      return false;
    } catch (_) {
      return false;
    }
  }

  /// Get wishlist ID (for backward compatibility if needed)
  Future<String?> getWishlistId(String userId, String courseId) async {
    try {
      final response = await _apiClient.client.get(
        '/api/wishlists',
        queryParameters: {
          'userId': userId,
          'courseId': courseId,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final items = data is Map<String, dynamic> && data.containsKey('data')
            ? data['data'] as List<dynamic>
            : data is List
                ? data
                : [];

        if (items.isNotEmpty) {
          final wishlist = items.first as Map<String, dynamic>;
          return wishlist['id'] as String?;
        }
        return null;
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  /// Toggle wishlist (add/remove course from wishlist)
  /// Returns true if in wishlist after toggle, false otherwise
  Future<bool> toggleWishlist(String courseId) async {
    try {
      final response = await _apiClient.client.post(
        '/api/wishlists/toggle/$courseId',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final dataMap = data is Map<String, dynamic> && data.containsKey('data')
            ? data['data'] as Map<String, dynamic>?
            : data as Map<String, dynamic>?;
        
        if (dataMap != null && dataMap.containsKey('isInWishlist')) {
          return dataMap['isInWishlist'] as bool? ?? false;
        }
        throw Exception('Invalid response format');
      } else {
        throw Exception('Failed to toggle wishlist: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Authentication required');
      }
      throw Exception('Failed to toggle wishlist: ${e.message}');
    } catch (e) {
      throw Exception('Failed to toggle wishlist: $e');
    }
  }
}

