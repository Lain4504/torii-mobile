/// Lesson model representing individual lesson in a module
class Lesson {
  final String id;
  final String title;
  final String contentType; // 'video', 'article', etc.
  final int? videoDuration; // Duration in seconds
  final String? videoUrl; // Video URL for video lessons
  final String? articleContent; // HTML content for article lessons
  final String? description; // Lesson description
  final int order;
  final bool isPreview;
  final bool isUnlocked;

  const Lesson({
    required this.id,
    required this.title,
    required this.contentType,
    this.videoDuration,
    this.videoUrl,
    this.articleContent,
    this.description,
    required this.order,
    this.isPreview = false,
    this.isUnlocked = true,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] as String,
      title: json['title'] as String,
      contentType: json['contentType'] as String? ?? 'video',
      videoDuration: json['videoDuration'] as int?,
      videoUrl: json['videoUrl'] as String?,
      articleContent: json['articleContent'] as String?,
      description: json['description'] as String?,
      order: json['order'] as int? ?? json['orderIndex'] as int? ?? 0,
      isPreview: json['isPreview'] as bool? ?? false,
      isUnlocked: json['isUnlocked'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'contentType': contentType,
      'videoDuration': videoDuration,
      'videoUrl': videoUrl,
      'articleContent': articleContent,
      'description': description,
      'order': order,
      'isPreview': isPreview,
      'isUnlocked': isUnlocked,
    };
  }

  /// Format duration in minutes
  String get durationLabel {
    if (videoDuration == null) return 'N/A';
    final minutes = (videoDuration! / 60).ceil();
    return '$minutes min';
  }

  /// Check if lesson is video type
  bool get isVideo => contentType.toLowerCase() == 'video';

  /// Check if lesson is article type
  bool get isArticle => contentType.toLowerCase() == 'article';
}


