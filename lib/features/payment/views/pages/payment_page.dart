import 'package:flutter/material.dart';
import '../../viewmodels/payment_vm.dart';
import '../widgets/payment_card.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: connect PaymentVM
    return Scaffold(
      appBar: AppBar(title: const Text('Payments')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          PaymentCard(title: 'Order #123', amount: '¥2,000'),
        ],
      ),
    );
  }
}