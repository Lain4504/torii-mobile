import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../constants/app_design_system.dart';

/// Payment QR Card - Minimal Zen UI Component
/// 
/// A glassmorphic card displaying a QR code for payment with breathing animation
/// to draw user attention. Follows the Torii minimal zen design aesthetic.
class PaymentQRCard extends StatefulWidget {
  final String qrData;
  final String? title;
  final String? subtitle;
  final double size;
  final bool animate;

  const PaymentQRCard({
    super.key,
    required this.qrData,
    this.title,
    this.subtitle,
    this.size = 250,
    this.animate = true,
  });

  @override
  State<PaymentQRCard> createState() => _PaymentQRCardState();
}

class _PaymentQRCardState extends State<PaymentQRCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    
    if (widget.animate) {
      _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
      )..repeat(reverse: true);

      // Breathing animation - subtle scale
      _scaleAnimation = Tween<double>(
        begin: 1.0,
        end: 1.02,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));

      // Pulsing glow
      _opacityAnimation = Tween<double>(
        begin: 0.3,
        end: 0.6,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));
    }
  }

  @override
  void dispose() {
    if (widget.animate) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: AppTypography.black,
              letterSpacing: 2.0,
              color: AppColors.textTertiary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
        
        // QR Code Container with glow
        Stack(
          alignment: Alignment.center,
          children: [
            // Animated glow effect
            if (widget.animate)
              AnimatedBuilder(
                animation: _opacityAnimation,
                builder: (context, child) {
                  return Container(
                    width: widget.size + 40,
                    height: widget.size + 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.xl),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(
                            alpha: _opacityAnimation.value,
                          ),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  );
                },
              ),
            
            // QR Code with breathing animation
            widget.animate
                ? AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: child,
                      );
                    },
                    child: _buildQRCodeContainer(),
                  )
                : _buildQRCodeContainer(),
          ],
        ),
        
        if (widget.subtitle != null) ...[
          const SizedBox(height: AppSpacing.lg),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text(
              widget.subtitle!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ],
    );

    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        // Glassmorphic effect
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.1),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: content,
    );
  }

  Widget _buildQRCodeContainer() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: AppColors.grey200,
          width: 1,
        ),
        boxShadow: AppElevation.softShadow,
      ),
      child: QrImageView(
        data: widget.qrData,
        version: QrVersions.auto,
        size: widget.size,
        backgroundColor: Colors.white,
        errorCorrectionLevel: QrErrorCorrectLevel.M,
      ),
    );
  }
}
