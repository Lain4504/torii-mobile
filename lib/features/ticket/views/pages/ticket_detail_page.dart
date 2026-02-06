import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers/ticket_providers.dart';
import '../../data/models/ticket_model.dart';

class TicketDetailPage extends ConsumerWidget {
  final String ticketId;

  const TicketDetailPage({super.key, required this.ticketId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketAsync = ref.watch(ticketDetailProvider(ticketId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Details'),
      ),
      body: ticketAsync.when(
        data: (ticket) => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                     decoration: BoxDecoration(
                       color: _getStatusColor(ticket.status).withOpacity(0.1),
                       borderRadius: BorderRadius.circular(20),
                       border: Border.all(color: _getStatusColor(ticket.status)),
                     ),
                     child: Text(
                       ticket.status.name,
                       style: TextStyle(
                         color: _getStatusColor(ticket.status),
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   const Spacer(),
                   Text(
                     DateFormat('MMM dd, yyyy HH:mm').format(ticket.createdAt),
                     style: Theme.of(context).textTheme.bodySmall,
                   ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                ticket.subject,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
               const SizedBox(height: 8),
              Row(
                children: [
                   const Icon(Icons.label_outline, size: 16, color: Colors.grey),
                   const SizedBox(width: 4),
                   Text(
                     'Type: ${ticket.type.name}', 
                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                   ),
                ],
              ),
              const Divider(height: 32),
              
              const Text(
                'Description',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Text(ticket.description),
              ),
              
              if (ticket.metadata != null && ticket.metadata!.isNotEmpty) ...[
                const SizedBox(height: 20),
                 const Text(
                  'Additional Info',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: ticket.metadata!.entries.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Row(
                            children: [
                              Text('${e.key}: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                              Expanded(child: Text(e.value.toString())),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
              
              if (ticket.response != null && ticket.response!.isNotEmpty) ...[
                const SizedBox(height: 24),
                const Text(
                  'Response from Support',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue[100]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       if (ticket.handler != null)
                         Padding(
                           padding: const EdgeInsets.only(bottom: 8.0),
                           child: Row(
                             children: [
                               CircleAvatar(
                                 radius: 12,
                                 backgroundImage: ticket.handler?.avatarUrl != null 
                                     ? NetworkImage(ticket.handler!.avatarUrl!) 
                                     : null,
                                 child: ticket.handler?.avatarUrl == null 
                                     ? const Icon(Icons.person, size: 16) 
                                     : null,
                               ),
                               const SizedBox(width: 8),
                               Text(
                                 ticket.handler?.displayName ?? 'Support Staff',
                                 style: const TextStyle(fontWeight: FontWeight.bold),
                               ),
                             ],
                           ),
                         ),
                       Text(ticket.response!),
                       const SizedBox(height: 4),
                       if (ticket.updatedAt != ticket.createdAt)
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                             'Updated: ${DateFormat('MMM dd, HH:mm').format(ticket.updatedAt)}',
                             style: TextStyle(color: Colors.grey[600], fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                ),
              ]
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Color _getStatusColor(TicketStatus status) {
    switch (status) {
      case TicketStatus.APPROVED:
        return Colors.green;
      case TicketStatus.REJECTED:
        return Colors.red;
      case TicketStatus.PROCESSING:
        return Colors.blue;
      case TicketStatus.PENDING:
      default:
        return Colors.orange;
    }
  }
}
