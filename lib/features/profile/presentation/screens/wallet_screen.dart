import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/providers/api_providers.dart';
import '../../../../data/models/wallet_models.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final balanceAsync = ref.watch(walletBalanceProvider);
    final transactionsAsync = ref.watch(walletTransactionsProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ví Xu của tôi', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(walletBalanceProvider);
          ref.invalidate(walletTransactionsProvider);
          await ref.read(walletBalanceProvider.future);
          await ref.read(walletTransactionsProvider.future);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _buildBalanceHeader(theme, balanceAsync.value ?? 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(),
              ),
              _buildTransactionHistory(theme, transactionsAsync),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceHeader(ThemeData theme, int balance) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Số dư hiện hiệu',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            NumberFormat.currency(locale: 'vi_VN', symbol: 'Xu', decimalDigits: 0).format(balance),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _HeaderAction(icon: Icons.add_circle_outline, label: 'Nạp thêm'),
              SizedBox(width: 40),
              _HeaderAction(icon: Icons.history, label: 'Lịch sử'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTransactionHistory(ThemeData theme, AsyncValue<List<WalletTransaction>> transactionsAsync) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Giao dịch gần đây',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          transactionsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Lỗi tải lịch sử: $e')),
            data: (transactions) {
              if (transactions.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Icon(Icons.history_toggle_off, size: 64, color: theme.disabledColor),
                      const SizedBox(height: 16),
                      Text(
                        'Chưa có giao dịch nào',
                        style: TextStyle(color: theme.disabledColor),
                      ),
                    ],
                  ),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final tx = transactions[index];
                  final isPositive = tx.type == 'REFUND' || tx.type == 'BONUS';
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: (isPositive ? Colors.green : Colors.orange).withOpacity(0.1),
                      child: Icon(
                        isPositive ? Icons.add_rounded : Icons.remove_rounded,
                        color: isPositive ? Colors.green : Colors.orange,
                      ),
                    ),
                    title: Text(
                      tx.description.isNotEmpty ? tx.description : _getTypeLabel(tx.type),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(DateFormat('HH:mm dd/MM/yyyy').format(tx.createdAt)),
                    trailing: Text(
                      '${isPositive ? '+' : '-'}${NumberFormat.decimalPattern().format(tx.amount)} Xu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isPositive ? Colors.green : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  String _getTypeLabel(String type) {
    switch (type) {
      case 'REFUND': return 'Hoàn tiền';
      case 'PURCHASE': return 'Thanh toán';
      case 'BONUS': return 'Thưởng';
      default: return 'Giao dịch';
    }
  }
}

class _HeaderAction extends StatelessWidget {
  final IconData icon;
  final String label;
  const _HeaderAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
