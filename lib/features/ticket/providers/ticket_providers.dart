import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import '../data/repositories/ticket_repository.dart';
import '../data/models/ticket_model.dart';
import '../data/models/create_ticket_dto.dart';

// Repository Provider
final ticketRepositoryProvider = Provider<TicketRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return TicketRepository(dio: apiClient.client);
});

// Ticket List Provider
class TicketListNotifier extends AutoDisposeNotifier<AsyncValue<List<Ticket>>> {
  TicketRepository get _repository => ref.read(ticketRepositoryProvider);

  @override
  AsyncValue<List<Ticket>> build() {
    ref.watch(authStateProvider); // Watch auth state to force refresh on login/logout
    Future.microtask(() => fetchTickets());
    return const AsyncValue.loading();
  }

  Future<void> fetchTickets({
    int page = 1,
    int limit = 10,
    String? search,
    TicketStatus? status,
    TicketType? type,
  }) async {
    state = const AsyncValue.loading();
    try {
      final tickets = await _repository.getTickets(
        page: page,
        limit: limit,
        search: search,
        status: status,
        type: type,
      );
      state = AsyncValue.data(tickets);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  
  Future<void> refresh() async {
    await fetchTickets();
  }
}

final ticketListProvider = NotifierProvider.autoDispose<TicketListNotifier, AsyncValue<List<Ticket>>>(TicketListNotifier.new);

// Ticket Detail Provider
final ticketDetailProvider = FutureProvider.autoDispose.family<Ticket, String>((ref, id) async {
  final repository = ref.watch(ticketRepositoryProvider);
  return repository.getTicket(id);
});

// Create Ticket State
class CreateTicketState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  const CreateTicketState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  CreateTicketState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return CreateTicketState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

class CreateTicketNotifier extends AutoDisposeNotifier<CreateTicketState> {
  TicketRepository get _repository => ref.read(ticketRepositoryProvider);

  @override
  CreateTicketState build() {
    return const CreateTicketState();
  }

  Future<bool> createTicket(CreateTicketDTO dto) async {
    state = state.copyWith(isLoading: true, error: null, isSuccess: false);
    try {
      await _repository.createTicket(dto);
      state = state.copyWith(isLoading: false, isSuccess: true);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }
  
  void reset() {
    state = const CreateTicketState();
  }
}

final createTicketProvider = NotifierProvider.autoDispose<CreateTicketNotifier, CreateTicketState>(CreateTicketNotifier.new);
