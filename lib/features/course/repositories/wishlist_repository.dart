import 'package:dio/dio.dart';
import '../../../data/api/api_client.dart';

/// Repository for wishlist-related API calls
class WishlistRepository {
  final ApiClient _apiClient;

  WishlistRepository(this._apiClient);

  /// Check if course is in user's wishlist
  /// Returns wishlist ID if found, null otherwise
  Future<String?> checkWishlist(String userId, String courseId) async {
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
        
        // Handle paginated response
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
    } on DioException catch (e) {
      // If 401, user is not authenticated - return null
      if (e.response?.statusCode == 401) {
        return null;
      }
      // For other errors, return null (assume not in wishlist)
      return null;
    } catch (_) {
      return null;
    }
  }

  /// Add course to wishlist
  Future<String> addToWishlist(String courseId) async {
    try {
      final response = await _apiClient.client.post(
        '/api/wishlists',
        data: {
          'courseId': courseId,
          // userId will be extracted from JWT token by backend
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final wishlistData = data is Map<String, dynamic> && data.containsKey('data')
            ? data['data'] as Map<String, dynamic>
            : data as Map<String, dynamic>;
        
        return wishlistData['id'] as String;
      } else {
        throw Exception('Failed to add to wishlist: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Authentication required');
      }
      throw Exception('Failed to add to wishlist: ${e.message}');
    } catch (e) {
      throw Exception('Failed to add to wishlist: $e');
    }
  }

  /// Remove course from wishlist
  Future<void> removeFromWishlist(String wishlistId) async {
    try {
      final response = await _apiClient.client.delete('/api/wishlists/$wishlistId');

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to remove from wishlist: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Authentication required');
      }
      if (e.response?.statusCode == 404) {
        // Already removed, consider it success
        return;
      }
      throw Exception('Failed to remove from wishlist: ${e.message}');
    } catch (e) {
      throw Exception('Failed to remove from wishlist: $e');
    }
  }
}

