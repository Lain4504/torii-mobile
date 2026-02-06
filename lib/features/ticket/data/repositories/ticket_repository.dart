import 'package:dio/dio.dart';
import '../models/ticket_model.dart';
import '../models/create_ticket_dto.dart';

class TicketRepository {
  final Dio _dio;

  TicketRepository({required Dio dio}) : _dio = dio;

  Future<Ticket> createTicket(CreateTicketDTO dto) async {
    try {
      final response = await _dio.post(
        '/api/tickets',
        data: dto.toJson(),
      );
      // Depending on backend, response.data might be the ticket object or { data: ticket }
      // The requirement says "201 Created: Ticket submitted successfully" but doesn't specify if it returns the object.
      // Usually it returns the created object. Assuming standard response format.
      // If the response structure is { data: {...} } or just {...}
      
      final data = response.data;
      if (data is Map<String, dynamic> && data.containsKey('data')) {
           return Ticket.fromJson(data['data']);
      }
      return Ticket.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Ticket>> getTickets({
    int page = 1,
    int limit = 10,
    String? search,
    TicketStatus? status,
    TicketType? type,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'limit': limit,
        if (search != null && search.isNotEmpty) 'search': search,
        if (status != null) 'status': status.toString().split('.').last, // TicketStatus.PENDING -> PENDING
        if (type != null) 'type': type.toString().split('.').last, // TicketType.SUPPORT -> SUPPORT
      };

      final response = await _dio.get(
        '/api/tickets',
        queryParameters: queryParams,
      );

      final data = response.data;
      List<dynamic> listCallback;
      
      if (data is Map<String, dynamic> && data.containsKey('data')) {
         listCallback = data['data'] as List<dynamic>;
      } else if (data is List) {
         listCallback = data;
      } else {
        return [];
      }

      return listCallback.map((e) => Ticket.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Ticket> getTicket(String id) async {
    try {
      final response = await _dio.get('/api/tickets/$id');
      final data = response.data;
       if (data is Map<String, dynamic> && data.containsKey('data')) {
           return Ticket.fromJson(data['data']);
      }
      return Ticket.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
