import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for payment processing
class PaymentState {
  final List<dynamic> paymentMethods; // TODO: Replace with PaymentMethod model
  final String? selectedMethodId;
  final bool isProcessing;
  final bool isSuccess;
  final String? error;

  const PaymentState({
    this.paymentMethods = const [],
    this.selectedMethodId,
    this.isProcessing = false,
    this.isSuccess = false,
    this.error,
  });

  PaymentState copyWith({
    List<dynamic>? paymentMethods,
    String? selectedMethodId,
    bool? isProcessing,
    bool? isSuccess,
    String? error,
  }) {
    return PaymentState(
      paymentMethods: paymentMethods ?? this.paymentMethods,
      selectedMethodId: selectedMethodId ?? this.selectedMethodId,
      isProcessing: isProcessing ?? this.isProcessing,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }
}

/// Notifier for payment processing
class PaymentNotifier extends Notifier<PaymentState> {
  @override
  PaymentState build() => const PaymentState();

  // TODO: Inject PaymentRepository
  
  Future<void> loadPaymentMethods() async {
    try {
      // TODO: Call repository to fetch payment methods
      await Future.delayed(const Duration(milliseconds: 500));
      
      state = state.copyWith(
        paymentMethods: [], // TODO: Set actual payment methods
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void selectPaymentMethod(String methodId) {
    state = state.copyWith(selectedMethodId: methodId);
  }

  Future<void> processPayment({
    required String courseId,
    required double amount,
  }) async {
    if (state.selectedMethodId == null) {
      state = state.copyWith(error: 'Vui lòng chọn phương thức thanh toán');
      return;
    }

    state = state.copyWith(
      isProcessing: true,
      isSuccess: false,
      error: null,
    );
    
    try {
      // TODO: Call payment service/repository
      await Future.delayed(const Duration(seconds: 2)); // Simulate payment
      
      state = state.copyWith(
        isProcessing: false,
        isSuccess: true,
      );
    } catch (e) {
      state = state.copyWith(
        isProcessing: false,
        isSuccess: false,
        error: e.toString(),
      );
    }
  }

  void resetPayment() {
    state = const PaymentState();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
