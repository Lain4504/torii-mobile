import 'package:dio/dio.dart';
import '../models/order_model.dart';

/// Payment Repository - Handles API calls for orders and payments
class PaymentRepository {
  final Dio _dio;

  PaymentRepository({
    required Dio dio,
  }) : _dio = dio;

  /// Create a new order for course purchase
  Future<Order> createOrder(OrderCreateRequest request) async {
    try {
      final response = await _dio.post(
        '/api/orders',
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        // Handle response structure: { success: true, data: { order: {...} } }
        Map<String, dynamic> orderData;
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          final dataMap = data['data'] as Map<String, dynamic>?;
          // Check if data contains 'order' key (backend returns { order: {...} })
          if (dataMap != null && dataMap.containsKey('order')) {
            orderData = dataMap['order'] as Map<String, dynamic>;
          } else {
            // Fallback: assume data is the order object itself
            orderData = dataMap as Map<String, dynamic>;
          }
        } else {
          orderData = data as Map<String, dynamic>;
        }
        
        return Order.fromJson(orderData);
      } else {
        throw Exception('Failed to create order: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Invalid order data: ${e.response?.data}');
      }
      throw Exception('Failed to create order: ${e.message}');
    } catch (e) {
      throw Exception('Failed to create order: $e');
    }
  }

  /// Get order by ID
  Future<Order> getOrder(String orderId) async {
    try {
      final response = await _dio.get('/api/orders/$orderId');
      
      if (response.statusCode == 200) {
        final data = response.data;
        Map<String, dynamic> orderData;
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          final dataMap = data['data'] as Map<String, dynamic>?;
          orderData = dataMap?['order'] as Map<String, dynamic>? ?? dataMap as Map<String, dynamic>;
        } else {
          orderData = data as Map<String, dynamic>;
        }
        
        return Order.fromJson(orderData);
      } else {
        throw Exception('Failed to fetch order: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('Order not found');
      }
      throw Exception('Failed to fetch order: ${e.message}');
    } catch (e) {
      throw Exception('Failed to fetch order: $e');
    }
  }

  /// Confirm order (after payment is completed)
  Future<Order> confirmOrder(String orderId, {String? transactionId, String? gatewayTransactionId}) async {
    try {
      final response = await _dio.post(
        '/api/orders/$orderId/confirm',
        data: {
          'orderId': orderId,
          if (transactionId != null) 'transactionId': transactionId,
          if (gatewayTransactionId != null) 'gatewayTransactionId': gatewayTransactionId,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        Map<String, dynamic> orderData;
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          final dataMap = data['data'] as Map<String, dynamic>?;
          orderData = dataMap?['order'] as Map<String, dynamic>? ?? dataMap as Map<String, dynamic>;
        } else {
          orderData = data as Map<String, dynamic>;
        }
        
        return Order.fromJson(orderData);
      } else {
        throw Exception('Failed to confirm order: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to confirm order: ${e.message}');
    } catch (e) {
      throw Exception('Failed to confirm order: $e');
    }
  }

  /// Get all orders for current user
  Future<List<Order>> getMyOrders({
    int page = 1,
    int limit = 20,
    OrderStatus? status,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
      };

      if (status != null) {
        queryParams['status'] = status.name;
      }

      final response = await _dio.get(
        '/api/orders',
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final list = data is Map<String, dynamic> && data.containsKey('data')
            ? data['data'] as List
            : data as List;
            
        return list.map((item) => Order.fromJson(item as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to fetch orders');
      }
    } catch (e) {
      throw Exception('Failed to fetch orders: $e');
    }
  }

  /// Get user balance transaction history
  Future<List<Map<String, dynamic>>> getBalanceHistory({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _dio.get(
        '/api/orders/wallet/balance-history',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic> && data['success'] == true) {
          final list = data['data']['data'] as List;
          return list.cast<Map<String, dynamic>>();
        }
      }
      throw Exception('Failed to fetch balance history');
    } catch (e) {
      throw Exception('Failed to fetch balance history: $e');
    }
  }
}
