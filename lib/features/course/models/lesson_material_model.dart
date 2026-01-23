/// Lesson Material model
class LessonMaterial {
  final String id;
  final String lessonId;
  final String fileAssetId;
  final String type; // 'slides', 'video', 'reading', 'assignment'
  final String? title;
  final int orderIndex;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  // File asset details
  final String fileUrl;
  final String? mimeType;
  final int? fileSize; // in bytes
  final String status;

  const LessonMaterial({
    required this.id,
    required this.lessonId,
    required this.fileAssetId,
    required this.type,
    this.title,
    required this.orderIndex,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.fileUrl,
    this.mimeType,
    this.fileSize,
    required this.status,
  });

  factory LessonMaterial.fromJson(Map<String, dynamic> json) {
    try {
      final fileAsset = json['fileAsset'] as Map<String, dynamic>? ?? {};
      
      // Safe date parsing - always returns non-null DateTime
      DateTime parseDate(dynamic dateValue) {
        if (dateValue == null) return DateTime.now();
        if (dateValue is DateTime) return dateValue;
        if (dateValue is String) {
          try {
            return DateTime.parse(dateValue);
          } catch (e) {
            return DateTime.now();
          }
        }
        return DateTime.now();
      }
      
      return LessonMaterial(
        id: (json['id'] as String?) ?? '',
        lessonId: (json['lessonId'] as String?) ?? '',
        fileAssetId: (json['fileAssetId'] as String?) ?? '',
        type: (json['type'] as String?) ?? 'reading',
        title: json['title'] as String?,
        orderIndex: (json['orderIndex'] as int?) ?? (json['orderIndex'] as num?)?.toInt() ?? 0,
        createdBy: (json['createdBy'] as String?) ?? '',
        createdAt: parseDate(json['createdAt']),
        updatedAt: parseDate(json['updatedAt']),
        fileUrl: (fileAsset['fileUrl'] as String?) ?? '',
        mimeType: fileAsset['mimeType'] as String?,
        fileSize: fileAsset['fileSize'] != null 
            ? (fileAsset['fileSize'] is int 
                ? fileAsset['fileSize'] as int 
                : (fileAsset['fileSize'] is num 
                    ? (fileAsset['fileSize'] as num).toInt()
                    : null))
            : null,
        status: (fileAsset['status'] as String?) ?? 'active',
      );
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lessonId': lessonId,
      'fileAssetId': fileAssetId,
      'type': type,
      'title': title,
      'orderIndex': orderIndex,
      'createdBy': createdBy,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'fileAsset': {
        'fileUrl': fileUrl,
        'mimeType': mimeType,
        'fileSize': fileSize,
        'status': status,
      },
    };
  }

  /// Get file extension from mime type or URL
  String get fileExtension {
    if (mimeType != null) {
      if (mimeType!.contains('pdf')) return 'pdf';
      if (mimeType!.contains('powerpoint') || mimeType!.contains('presentation')) return 'pptx';
      if (mimeType!.contains('mp4')) return 'mp4';
      if (mimeType!.contains('png')) return 'png';
      if (mimeType!.contains('jpeg') || mimeType!.contains('jpg')) return 'jpg';
    }
    // Fallback to URL extension
    final uri = Uri.tryParse(fileUrl);
    if (uri != null) {
      final path = uri.path;
      final ext = path.split('.').last.toLowerCase();
      if (ext.isNotEmpty && ext.length < 5) return ext;
    }
    return 'file';
  }

  /// Format file size
  String get formattedFileSize {
    if (fileSize == null) return 'N/A';
    if (fileSize! < 1024) return '${fileSize}B';
    if (fileSize! < 1024 * 1024) return '${(fileSize! / 1024).toStringAsFixed(1)} KB';
    return '${(fileSize! / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  /// Check if material is PDF
  bool get isPdf => fileExtension == 'pdf' || mimeType?.contains('pdf') == true;

  /// Check if material is video
  bool get isVideo => fileExtension == 'mp4' || mimeType?.contains('mp4') == true || type == 'video';
}
