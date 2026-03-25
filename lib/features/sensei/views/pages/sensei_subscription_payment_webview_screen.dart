import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/constants/app_design_system.dart';
import '../../providers/sensei_subscription_providers.dart';

class SenseiSubscriptionPaymentWebViewScreen extends ConsumerStatefulWidget {
  const SenseiSubscriptionPaymentWebViewScreen({
    super.key,
    required this.paymentUrl,
    required this.orderCode,
  });

  final String paymentUrl;
  final String orderCode;

  @override
  ConsumerState<SenseiSubscriptionPaymentWebViewScreen> createState() =>
      _SenseiSubscriptionPaymentWebViewScreenState();
}

class _SenseiSubscriptionPaymentWebViewScreenState
    extends ConsumerState<SenseiSubscriptionPaymentWebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _didComplete = false;

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
    if (_didComplete) return;
    if (!mounted) return;

    final lower = url.toLowerCase();
    if (!lower.contains('ordercode=')) return;

    final uri = Uri.tryParse(url);
    final orderCode = uri?.queryParameters['orderCode'] ?? widget.orderCode;
    if (orderCode.isEmpty) return;

    _didComplete = true;
    await Future<void>.delayed(const Duration(milliseconds: 150));

    ref.invalidate(senseiQuotaStatusProvider);
    ref.invalidate(senseiSubscriptionPlansProvider);

    if (!mounted) return;
    context.go('/sensei/subscription');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('Thanh toán'),
        elevation: 0,
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

