import 'package:dio/dio.dart';
import '../../core/models/api_response.dart';
import '../models/ticket_models.dart';

class TicketRepository {
  const TicketRepository(this._dio);

  final Dio _dio;

  Future<List<TicketModel>> getMyTickets() async {
    final response = await _dio.get<dynamic>('/api/tickets/me');
    final rawData = response.data;
    if (rawData == null) return [];
    
    List<dynamic> items = [];
    final dataNode = (rawData is Map && rawData.containsKey('data') && rawData['data'] != null)
        ? rawData['data']
        : rawData;
        
    if (dataNode is List) {
      items = dataNode;
    } else if (dataNode is Map) {
      items = dataNode['items'] as List<dynamic>? ?? dataNode['tickets'] as List<dynamic>? ?? dataNode['data'] as List<dynamic>? ?? [];
    } else if (rawData is Map && rawData.containsKey('items') && rawData['items'] != null) {
      items = rawData['items'] as List<dynamic>;
    }
    
    return items.map((e) => TicketModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<TicketModel?> createTicket({
    required String title,
    required String content,
    String priority = 'NORMAL',
    String category = 'TECHNICAL',
  }) async {
    final normalizedTitle = title.trim();
    final normalizedContent = content.trim();
    final normalizedCategory = category.trim().isEmpty
        ? 'TECHNICAL'
        : category.trim().toUpperCase();
    final normalizedPriority = priority.trim().isEmpty
        ? 'NORMAL'
        : priority.trim().toUpperCase();

    final response = await _dio.post<dynamic>(
      '/api/tickets',
      data: <String, dynamic>{
        // New backend contract
        'subject': normalizedTitle,
        'description': normalizedContent,
        // Omit `type` until we have exact TicketType enum from backend.
        // Sending an unknown enum (e.g. TECHNICAL) causes 400.
        // Keep old keys for backward compatibility
        'title': normalizedTitle,
        'content': normalizedContent,
        'priority': normalizedPriority,
        'category': normalizedCategory,
      },
    );
    
    final rawData = response.data ?? {};
    final isError = rawData is Map ? (rawData['success'] == false || rawData.containsKey('error') || rawData['statusCode'] == 400 || rawData['statusCode'] == 500) : false;
    
    if (isError) {
      throw Exception((rawData is Map ? rawData['message'] : null) ?? 'Không thể gửi yêu cầu hỗ trợ');
    }
    
    final dataNode = (rawData is Map && rawData.containsKey('data') && rawData['data'] != null)
        ? rawData['data']
        : rawData;
        
    final item = (dataNode is Map && dataNode.containsKey('item')) ? dataNode['item'] : dataNode;
    if (item is Map) {
      return TicketModel.fromJson(item as Map<String, dynamic>);
    }
    return null;
  }
}
