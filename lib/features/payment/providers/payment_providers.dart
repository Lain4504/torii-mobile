import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/payment/models/order_model.dart';
import 'package:torii_app/features/payment/repositories/payment_repository.dart';

/// Payment Repository Provider
final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return PaymentRepository(dio: apiClient.client);
});

/// Payment State
class PaymentState {
  final Order? order;
  final bool isLoading;
  final String? error;
  final bool isPolling;

  const PaymentState({
    this.order,
    this.isLoading = false,
    this.error,
    this.isPolling = false,
  });

  PaymentState copyWith({
    Order? order,
    bool? isLoading,
    String? error,
    bool? isPolling,
  }) {
    return PaymentState(
      order: order ?? this.order,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isPolling: isPolling ?? this.isPolling,
    );
  }
}

/// Payment Notifier
class PaymentNotifier extends Notifier<PaymentState> {
  @override
  PaymentState build() {
    return const PaymentState();
  }

  Future<void> createOrder({
    required String courseId,
    required double amount,
    String? description,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final repository = ref.read(paymentRepositoryProvider);
      
      final request = OrderCreateRequest(
        courseId: courseId,
        paymentMethod: PaymentMethod.payos,
        paymentGateway: PaymentGateway.payos,
        orderType: OrderType.coursePurchase,
        description: description ?? 'Thanh toán khóa học',
        returnUrl: 'torii://payment/return',
        cancelUrl: 'torii://payment/cancel',
        metadata: {
          'courseId': courseId,
          'amount': amount,
        },
      );

      final order = await repository.createOrder(request);
      
      state = state.copyWith(
        order: order,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> loadOrder(String orderId) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final repository = ref.read(paymentRepositoryProvider);
      final order = await repository.getOrder(orderId);
      
      state = state.copyWith(
        order: order,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> checkOrderStatus(String orderId) async {
    state = state.copyWith(isPolling: true);
    
    try {
      final repository = ref.read(paymentRepositoryProvider);
      final order = await repository.getOrder(orderId);
      
      state = state.copyWith(
        order: order,
        isPolling: false,
      );
    } catch (e) {
      state = state.copyWith(
        isPolling: false,
        error: e.toString(),
      );
    }
  }

  Future<void> confirmOrder(String orderId) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final repository = ref.read(paymentRepositoryProvider);
      final order = await repository.confirmOrder(orderId);
      
      state = state.copyWith(
        order: order,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void clear() {
    state = const PaymentState();
  }
}

/// Payment Provider
final paymentProvider = NotifierProvider<PaymentNotifier, PaymentState>(
  PaymentNotifier.new,
);

/// Order List State
class OrderListState {
  final List<Order> orders;
  final bool isLoading;
  final String? error;
  final int page;
  final bool hasMore;

  const OrderListState({
    this.orders = const [],
    this.isLoading = false,
    this.error,
    this.page = 1,
    this.hasMore = true,
  });

  OrderListState copyWith({
    List<Order>? orders,
    bool? isLoading,
    String? error,
    int? page,
    bool? hasMore,
  }) {
    return OrderListState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

/// Order List Notifier
class OrderListNotifier extends Notifier<OrderListState> {
  @override
  OrderListState build() {
    return const OrderListState();
  }

  Future<void> loadOrders({bool refresh = false}) async {
    if (state.isLoading) return;
    
    if (refresh) {
      state = const OrderListState(isLoading: true);
    } else {
      state = state.copyWith(isLoading: true, error: null);
    }

    try {
      final repository = ref.read(paymentRepositoryProvider);
      final newOrders = await repository.getMyOrders(
        page: refresh ? 1 : state.page,
        limit: 20,
      );

      state = state.copyWith(
        orders: refresh ? newOrders : [...state.orders, ...newOrders],
        isLoading: false,
        page: (refresh ? 1 : state.page) + 1,
        hasMore: newOrders.length >= 20,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

/// Order List Provider
final orderListProvider = NotifierProvider<OrderListNotifier, OrderListState>(
  OrderListNotifier.new,
);
