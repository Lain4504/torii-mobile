import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

/// PayOS WebView Screen - Hiển thị PayOS checkout trong app
class PayOSWebViewScreen extends StatefulWidget {
  final String checkoutUrl;
  final String orderId;

  const PayOSWebViewScreen({
    super.key,
    required this.checkoutUrl,
    required this.orderId,
  });

  @override
  State<PayOSWebViewScreen> createState() => _PayOSWebViewScreenState();
}

class _PayOSWebViewScreenState extends State<PayOSWebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
              _error = null;
            });
            
            // Check if URL contains return/cancel indicators
            _handleNavigation(url);
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
            
            _handleNavigation(url);
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              _isLoading = false;
              _error = error.description;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.checkoutUrl));
  }

  void _handleNavigation(String url) {
    // Check for PayOS return URLs
    if (url.contains('torii://payment/return') || 
        url.contains('payment/return') ||
        url.contains('checkout/return')) {
      // Payment completed or cancelled
      if (mounted) {
        context.pop(true); // Return success to trigger refresh
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
          onPressed: () => context.pop(false),
        ),
        title: const Text(
          'THANH TOÁN PAYOS',
          style: TextStyle(
            fontFamily: AppTypography.fontFamilySerif,
            fontWeight: AppTypography.black,
            fontSize: 18,
            letterSpacing: 2.0,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: Stack(
        children: [
          if (_error != null)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.error),
                  const SizedBox(height: 16),
                  Text(
                    'Lỗi tải trang thanh toán',
                    style: TextStyle(color: AppColors.error),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _error!,
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _error = null;
                        _isLoading = true;
                      });
                      _controller.reload();
                    },
                    child: const Text('THỬ LẠI'),
                  ),
                ],
              ),
            )
          else
            WebViewWidget(controller: _controller),
          
          if (_isLoading && _error == null)
            Container(
              color: Colors.white.withValues(alpha: 0.9),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
