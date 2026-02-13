import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/bottom_icons_provider.dart';
import '../../../providers/session_provider.dart';
import 'control_button.dart';

/// Raise Hand Button Widget
/// Toggles raise hand state via NATS (REQ_RAISE_HAND / REQ_LOWER_HAND)
/// 1:1 clone of apps/meet/src/components/footer/icons/raisehand.tsx
class RaiseHandButton extends ConsumerWidget {
  const RaiseHandButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActiveRaisehand = ref.watch(
      bottomIconsProvider.select((s) => s.isActiveRaisehand),
    );
    return ControlButton(
      icon: Icons.back_hand,
      label: isActiveRaisehand ? 'Lower hand' : 'Raise hand',
      isActive: isActiveRaisehand,
      onTap: () {
        final nextRaise = !isActiveRaisehand;
        ref.read(bottomIconsProvider.notifier).updateIsActiveRaisehand(nextRaise);
        final conn = ref.read(sessionProvider.notifier).natsConn;
        if (conn != null) {
          final userName = ref.read(sessionProvider).currentUser?.name ?? 'Someone';
          conn.sendRaiseHand(
            raise: nextRaise,
            msg: nextRaise ? '$userName has raised their hand' : '',
          );
        }
      },
    );
  }
}
