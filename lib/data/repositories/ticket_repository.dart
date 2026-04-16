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
    required String type,
    required String subject,
    required String description,
    String? liveClassId,
    String? vodPackageId,
    Map<String, dynamic>? metadata,
  }) async {
    final response = await _dio.post<dynamic>(
      '/api/tickets',
      data: <String, dynamic>{
        'type': type,
        'subject': subject.trim(),
        'description': description.trim(),
        if (liveClassId != null) 'liveClassId': liveClassId,
        if (vodPackageId != null) 'vodPackageId': vodPackageId,
        if (metadata != null) 'metadata': metadata,
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
