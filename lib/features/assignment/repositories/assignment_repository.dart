import 'package:dio/dio.dart';
import '../models/assignment_model.dart';

class AssignmentRepository {
  final Dio _dio;

  AssignmentRepository({required Dio dio}) : _dio = dio;

  Future<AssignmentListResponse> getMyAssignments({
    int page = 1,
    int limit = 20,
    String? status, // 'PENDING', 'SUBMITTED', 'GRADED'
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
      };

      if (status != null) {
        queryParams['status'] = status;
      }

      final response = await _dio.get(
        '/api/assignments/my-assignments',
        queryParameters: queryParams,
      );

      return AssignmentListResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch assignments: $e');
    }
  }

  Future<Assignment> getAssignmentDetails(String assignmentId) async {
    try {
      final response = await _dio.get('/api/assignments/$assignmentId');
      
      final data = response.data;
      Map<String, dynamic> assignmentData;
      if (data is Map<String, dynamic> && data.containsKey('data')) {
        final dataMap = data['data'] as Map<String, dynamic>?;
        if (dataMap != null && dataMap.containsKey('assignment')) {
          assignmentData = dataMap['assignment'] as Map<String, dynamic>;
        } else {
          assignmentData = dataMap as Map<String, dynamic>;
        }
      } else {
        assignmentData = data as Map<String, dynamic>;
      }
      
      return Assignment.fromJson(assignmentData);
    } catch (e) {
      throw Exception('Failed to load assignment details: $e');
    }
  }

  Future<Submission> submitAssignment({
    required String assignmentId,
    String? textAnswer,
    List<String>? fileUrls,
    bool isDraft = false,
  }) async {
    try {
      final data = {
        if (textAnswer != null) 'textAnswer': textAnswer,
        if (fileUrls != null) 'fileUrls': fileUrls,
        'isDraft': isDraft,
      };

      final response = await _dio.post(
        '/api/assignments/$assignmentId/submissions',
        data: data,
      );

      final responseData = response.data;
      Map<String, dynamic> submissionData;
      if (responseData is Map<String, dynamic> && responseData.containsKey('data')) {
        final dataMap = responseData['data'] as Map<String, dynamic>?;
        if (dataMap != null && dataMap.containsKey('submission')) {
          submissionData = dataMap['submission'] as Map<String, dynamic>;
        } else {
          submissionData = dataMap as Map<String, dynamic>;
        }
      } else {
        submissionData = responseData as Map<String, dynamic>;
      }

      return Submission.fromJson(submissionData);
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message'] ?? 'Failed to submit assignment');
      }
      throw Exception('Failed to submit assignment: $e');
    }
  }
}

class AssignmentListResponse {
  final List<Assignment> assignments;
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  AssignmentListResponse({
    required this.assignments,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory AssignmentListResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> dataList = [];
    if (json.containsKey('data') && json['data'] is Map && json['data'].containsKey('assignments')) {
      dataList = json['data']['assignments'];
    } else if (json.containsKey('data') && json['data'] is List) {
      dataList = json['data'];
    }

    return AssignmentListResponse(
      assignments: dataList.map((item) => Assignment.fromJson(item)).toList(),
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['totalPages'] ?? 0,
    );
  }
}
