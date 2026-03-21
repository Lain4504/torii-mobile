import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';

class PaymentWebViewScreen extends ConsumerStatefulWidget {
  const PaymentWebViewScreen({
    super.key,
    required this.paymentUrl,
    required this.orderCode,
  });

  final String paymentUrl;
  final String orderCode;

  @override
  ConsumerState<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends ConsumerState<PaymentWebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => _isLoading = true),
          onPageFinished: (url) async {
            setState(() => _isLoading = false);
            await _maybeHandleReturn(url);
          },
          onNavigationRequest: (req) async {
            await _maybeHandleReturn(req.url);
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  Future<void> _maybeHandleReturn(String url) async {
    if (!mounted) return;
    final lower = url.toLowerCase();
    if (!lower.contains('ordercode=')) return;

    final uri = Uri.tryParse(url);
    final orderCode = uri?.queryParameters['orderCode'] ?? widget.orderCode;
    if (orderCode.isEmpty) return;

    // PayOS returnUrl/cancelUrl currently points to web-learner.
    // We treat both as completion and check order status via API.
    await Future<void>.delayed(const Duration(milliseconds: 150));
    if (!mounted) return;

    // Refresh data sources that might change after payment
    ref.invalidate(myOrdersProvider);
    ref.invalidate(myEnrollmentsProvider);

    context.go('/payment-result/$orderCode');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(
          'Thanh toán',
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

