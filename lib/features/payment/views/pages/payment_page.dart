import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/payment_providers.dart';
import '../widgets/payment_card.dart';

class PaymentPage extends ConsumerWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments'),
      ),
      body: state.isProcessing
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${state.error}'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => ref.read(paymentProvider.notifier).clearError(),
                        child: const Text('Dismiss'),
                      ),
                    ],
                  ),
                )
              : state.isSuccess
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle, color: Colors.green, size: 64),
                          SizedBox(height: 16),
                          Text('Payment successful!'),
                        ],
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: const [
                        // TODO: Display payment methods and history
                        PaymentCard(title: 'Order #123', amount: '¥2,000'),
                      ],
                    ),
    );
  }
}