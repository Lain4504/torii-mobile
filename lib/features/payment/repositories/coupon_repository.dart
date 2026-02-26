import 'package:dio/dio.dart';
import '../models/coupon_model.dart';

class CouponRepository {
  final Dio _dio;

  CouponRepository({required Dio dio}) : _dio = dio;

  Future<List<Coupon>> getMyCoupons() async {
    try {
      final response = await _dio.get('/api/billing/coupons/my-coupons');
      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic> && data['success'] == true) {
          final list = data['data'] as List;
          return list.map((item) => Coupon.fromJson(item as Map<String, dynamic>)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch my coupons: $e');
    }
  }
}
