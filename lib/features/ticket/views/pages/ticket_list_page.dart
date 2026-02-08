import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/ticket_providers.dart';
import '../../data/models/ticket_model.dart';
import '../widgets/create_ticket_drawer.dart';

class TicketListPage extends ConsumerStatefulWidget {
  const TicketListPage({super.key});

  @override
  ConsumerState<TicketListPage> createState() => _TicketListPageState();
}

class _TicketListPageState extends ConsumerState<TicketListPage> {
  // Key no longer needed since we are not using Scaffold drawer
  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showCreateTicketDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CreateTicketDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ticketsAsync = ref.watch(ticketListProvider);

    return Scaffold(
      // key: _scaffoldKey, // Remove key
      appBar: AppBar(
        title: const Text('Yêu cầu của tôi'),
      ),
      // drawer: const CreateTicketDrawer(), // Remove drawer
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateTicketDialog(context),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(ticketListProvider.notifier).refresh(),
        child: ticketsAsync.when(
          data: (tickets) {
            if (tickets.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.confirmation_number_outlined, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    const Text('Không tìm thấy yêu cầu nào', style: TextStyle(fontSize: 18, color: Colors.grey)),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      onPressed: () => _showCreateTicketDialog(context),
                      icon: const Icon(Icons.add),
                      label: const Text('Tạo yêu cầu đầu tiên'),
                    ),
                  ],
                ),
              );
            }
            return ListView.separated(
              itemCount: tickets.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return ListTile(
                  title: Text(ticket.subject, maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ticket.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('MMM dd, yyyy HH:mm').format(ticket.createdAt),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  leading: _buildStatusIcon(ticket.status),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    context.push('/settings/tickets/${ticket.id}');
                  },
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text('Lỗi: $error'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.read(ticketListProvider.notifier).refresh(),
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIcon(TicketStatus status) {
    Color color;
    IconData icon;
    switch (status) {
      case TicketStatus.APPROVED:
        color = Colors.green;
        icon = Icons.check_circle;
        break;
      case TicketStatus.REJECTED:
        color = Colors.red;
        icon = Icons.cancel;
        break;
      case TicketStatus.PROCESSING:
        color = Colors.blue;
        icon = Icons.sync;
        break;
      case TicketStatus.PENDING:
      default:
        color = Colors.orange;
        icon = Icons.hourglass_empty;
        break;
    }
    return CircleAvatar(
      backgroundColor: color.withOpacity(0.1),
      child: Icon(icon, color: color),
    );
  }
}
