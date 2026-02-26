import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_providers.dart';
import '../models/coupon_model.dart';
import '../repositories/coupon_repository.dart';

final couponRepositoryProvider = Provider<CouponRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return CouponRepository(dio: apiClient.client);
});

final myCouponsProvider = FutureProvider<List<Coupon>>((ref) async {
  final repository = ref.watch(couponRepositoryProvider);
  return repository.getMyCoupons();
});
