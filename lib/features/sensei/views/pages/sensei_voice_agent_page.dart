import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../providers/voice_agent_provider.dart';
import '../widgets/sensei_quota_header.dart';

class SenseiVoiceAgentPage extends ConsumerStatefulWidget {
  const SenseiVoiceAgentPage({super.key});

  @override
  ConsumerState<SenseiVoiceAgentPage> createState() => _SenseiVoiceAgentPageState();
}

class _SenseiVoiceAgentPageState extends ConsumerState<SenseiVoiceAgentPage>
  with TickerProviderStateMixin, WidgetsBindingObserver {
  static const _graphName = 'japanese_tutor';

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Animation cho vòng sáng
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Animation cho sóng âm
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    // Bắt đầu kết nối sau khi build xong frame đầu tiên
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(voiceAgentProvider.notifier).connect(_graphName);
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final notifier = ref.read(voiceAgentProvider.notifier);
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      unawaited(notifier.onAppPaused());
    } else if (state == AppLifecycleState.resumed) {
      unawaited(notifier.onAppResumed());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(ref.read(voiceAgentProvider.notifier).disconnect());
    _pulseController.dispose();
    _waveController.dispose();
    super.dispose();
  }

  String _getFriendlyErrorMessage(String error) {
    if (error.contains('microphone_permanently_denied')) {
      return 'Ứng dụng đã bị từ chối quyền truy cập Micro. Vui lòng cấp lại quyền trong Cài đặt để sử dụng tính năng này.';
    }
    if (error.contains('microphone_denied')) {
      return 'Bạn cần cấp quyền truy cập Micro để có thể hội thoại với AI Sensei.';
    }
    if (error.contains('quota_exceeded')) {
      return 'Bạn đã hết lượt sử dụng AI Sensei hôm nay. Vui lòng nâng cấp gói để tiếp tục.';
    }
    return 'Lỗi kết nối: ${error.replaceFirst('Exception: ', '')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final voiceState = ref.watch(voiceAgentProvider);
    final voiceNotifier = ref.read(voiceAgentProvider.notifier);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('AI Voice Sensei'),
        backgroundColor: Colors.transparent,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        actions: const [
          SenseiQuotaHeader(),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            voiceNotifier.disconnect();
            context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight - 40),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (voiceState.error != null)
                        Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 24),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.error.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: theme.colorScheme.error.withOpacity(0.3)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _getFriendlyErrorMessage(voiceState.error!),
                                style: TextStyle(color: theme.colorScheme.error, fontSize: 13, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                              if (voiceState.error!.contains('microphone_permanently_denied')) ...[
                                const SizedBox(height: 12),
                                ElevatedButton.icon(
                                  onPressed: () => openAppSettings(),
                                  icon: const Icon(Icons.settings_rounded, size: 18),
                                  label: const Text('Cấp quyền trong Cài đặt'),
                                  style: ElevatedButton.styleFrom(
                                    visualDensity: VisualDensity.compact,
                                    backgroundColor: theme.colorScheme.error,
                                    foregroundColor: theme.colorScheme.onError,
                                  ),
                                ),
                              ] else if (voiceState.error!.contains('microphone_denied')) ...[
                                const SizedBox(height: 12),
                                ElevatedButton.icon(
                                  onPressed: () => voiceNotifier.connect(_graphName),
                                  icon: const Icon(Icons.refresh_rounded, size: 18),
                                  label: const Text('Thử lại'),
                                  style: ElevatedButton.styleFrom(visualDensity: VisualDensity.compact),
                                ),
                              ] else if (voiceState.errorCode == 'quota_exceeded') ...[
                                const SizedBox(height: 12),
                                OutlinedButton.icon(
                                  onPressed: () => context.push('/sensei/subscription'),
                                  icon: const Icon(Icons.upgrade_rounded),
                                  label: const Text('Nâng cấp gói AI'),
                                ),
                              ],
                            ],
                          ),
                        ),
                      const Spacer(),
                      _buildCentralAvatar(voiceState, theme),
                      const SizedBox(height: 60),
                      _buildStatusText(voiceState, theme),
                      const Spacer(),
                      _buildControlPanel(voiceState, voiceNotifier, theme),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCentralAvatar(VoiceAgentState state, ThemeData theme) {
    final isConnected = state.isConnected && !state.isReconnecting;
    final isSpeaking = state.isAgentSpeaking;
    
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: isSpeaking ? 1.0 : 0.0),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutBack,
      builder: (context, speakingFactor, child) {
        final currentScale = 1.0 + (0.15 * speakingFactor);
            
        return Transform.scale(
          scale: currentScale,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isConnected 
                  ? theme.colorScheme.primary.withOpacity(0.05 + 0.15 * speakingFactor) 
                  : theme.colorScheme.surface,
              border: Border.all(
                color: isConnected 
                    ? Color.lerp(theme.colorScheme.primary.withOpacity(0.5), theme.colorScheme.primary, speakingFactor)!
                    : theme.colorScheme.outlineVariant,
                width: 4 + 2 * speakingFactor,
              ),
              boxShadow: [
                if (isConnected && speakingFactor > 0.01)
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.3 * speakingFactor),
                    blurRadius: 30 * speakingFactor,
                    spreadRadius: 10 * speakingFactor,
                  )
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.support_agent_rounded,
                  size: 90,
                  color: isConnected ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant,
                ),
                if (speakingFactor > 0.01)
                  Positioned(
                    top: 20,
                    right: 40,
                    child: Opacity(
                      opacity: speakingFactor.clamp(0.0, 1.0),
                      child: Icon(Icons.volume_up_rounded, color: theme.colorScheme.primary, size: 24),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusText(VoiceAgentState state, ThemeData theme) {
    String status = 'Đang khởi tạo...';
    String subStatus = '';
    Color color = theme.colorScheme.onSurface;

    if (state.error != null) {
      status = 'Lỗi kết nối';
      color = theme.colorScheme.error;
    } else if (state.isReconnecting) {
      status = 'Đang kết nối lại...';
      color = theme.colorScheme.primary;
    } else if (!state.isConnected) {
      status = 'Đang kết nối...';
      color = theme.colorScheme.onSurfaceVariant;
    } else {
      status = 'Đã kết nối';
      color = theme.colorScheme.primary; // Or green if available
      subStatus = 'Hãy thử giao tiếp bằng tiếng Nhật nhé';
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Column(
        key: ValueKey<String>('$status-$subStatus'),
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            status,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),
          if (subStatus.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              subStatus,
              style: TextStyle(color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7), fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildVisualizer(VoiceAgentState state, ThemeData theme) {
    if (!state.isConnected) return const SizedBox(height: 40);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: (state.isAgentSpeaking || state.isUserSpeaking) ? 1.0 : 0.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      builder: (context, amplitudeFactor, child) {
        return AnimatedBuilder(
          animation: _waveController,
          builder: (context, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                double animationValue = 0.5; // Default middle
                if (state.isAgentSpeaking) {
                  animationValue = (math.sin((_waveController.value * 2 * math.pi) + (index * 1.5)) + 1) / 2;
                } else if (state.isUserSpeaking) {
                  animationValue = (math.cos((_waveController.value * 3 * math.pi) + (index * 1.0)) + 1) / 2;
                }

                // Smoothly scale the wave height based on amplitudeFactor
                final height = 10.0 + (animationValue * 30.0 * amplitudeFactor);
                
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 6,
                  height: height, // Height gets updated 60fps
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: state.isAgentSpeaking 
                          ? theme.colorScheme.primary 
                          : (state.isUserSpeaking ? Colors.green : theme.colorScheme.outlineVariant),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              }),
            );
          },
        );
      },
    );
  }

  Widget _buildControlPanel(VoiceAgentState state, VoiceAgentNotifier notifier, ThemeData theme) {
    if (!state.isConnected) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: state.isConnecting ? null : () => notifier.connect(_graphName),
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          child: state.isConnecting
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(color: theme.colorScheme.onPrimary, strokeWidth: 2),
                )
              : const Text(
                  'Bắt đầu cuộc gọi',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Mic Toggle Button
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => notifier.toggleMicrophone(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: state.isMicOn ? theme.colorScheme.surface : theme.colorScheme.onSurface.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: state.isMicOn ? Border.all(color: theme.colorScheme.outlineVariant) : null,
                  boxShadow: state.isMicOn ? [
                    BoxShadow(
                      color: theme.colorScheme.onSurface.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ] : [],
                ),
                child: Icon(
                  state.isMicOn ? Icons.mic_rounded : Icons.mic_off_rounded,
                  color: state.isMicOn ? theme.colorScheme.onSurface : theme.colorScheme.onSurfaceVariant.withOpacity(0.7),
                  size: 32,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              state.isMicOn ? 'Tắt Mic' : 'Mở Mic',
              style: TextStyle(fontSize: 13, color: theme.colorScheme.onSurfaceVariant, fontWeight: FontWeight.w500),
            )
          ],
        ),

        // End Call Button
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                notifier.disconnect();
                context.pop();
              },
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.error.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Icon(
                  Icons.call_end_rounded,
                  color: theme.colorScheme.onError,
                  size: 36,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Kết thúc',
              style: TextStyle(fontSize: 13, color: theme.colorScheme.error, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ],
    );
  }
}
