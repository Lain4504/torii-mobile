import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_providers.dart';
import '../../data/repositories/ticket_repository.dart';
import '../../data/models/ticket_models.dart';

final ticketRepositoryProvider = Provider<TicketRepository>((ref) {
  return TicketRepository(ref.watch(dioForApiProvider));
});

final myTicketsProvider = FutureProvider.autoDispose<List<TicketModel>>((ref) async {
  final repo = ref.watch(ticketRepositoryProvider);
  return repo.getMyTickets();
});
