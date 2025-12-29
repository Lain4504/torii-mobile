import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'payment_state.dart';

/// Provider for payment state
final paymentProvider = NotifierProvider<PaymentNotifier, PaymentState>(
  PaymentNotifier.new,
);

// TODO: Add more payment-related providers
// Example:
// final paymentHistoryProvider = FutureProvider<List<Transaction>>((ref) async {
//   return await paymentRepository.getPaymentHistory();
// });
