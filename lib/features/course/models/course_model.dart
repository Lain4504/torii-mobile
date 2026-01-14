import 'dart:convert';

enum CourseType { vod, liveClass }

enum JLPTLevel { n1, n2, n3, n4, n5 }

class Course {
  final String id;
  final String title;
  final String? slug;
  final String? thumbnailUrl;
  final String? previewVideoUrl;
  final String instructorName;
  final String instructorAvatarUrl;
  final JLPTLevel level;
  final CourseType type;
  final double price;
  final double? discountPrice;
  final double rating;
  final int reviewCount;
  final int enrolledCount;
  final int totalLessons;
  final int totalQuizzes;
  final int? durationWeeks;
  final bool isEnrolled;
  final bool isFree;
  final bool featured;
  final String? description;
  final String? shortDescription;
  final List<String> tags;
  final List<String> learningOutcomes;
  final List<String> requirements;

  const Course({
    required this.id,
    required this.title,
    this.slug,
    this.thumbnailUrl,
    this.previewVideoUrl,
    required this.instructorName,
    required this.instructorAvatarUrl,
    required this.level,
    required this.type,
    required this.price,
    this.discountPrice,
    required this.rating,
    required this.reviewCount,
    required this.enrolledCount,
    this.totalLessons = 0,
    this.totalQuizzes = 0,
    this.durationWeeks,
    this.isEnrolled = false,
    this.isFree = false,
    this.featured = false,
    this.description,
    this.shortDescription,
    this.tags = const [],
    this.learningOutcomes = const [],
    this.requirements = const [],
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    // Parse JLPT Level
    JLPTLevel parseLevel(String? level) {
      if (level == null) return JLPTLevel.n5;
      final normalized = level.toUpperCase();
      switch (normalized) {
        case 'N1':
          return JLPTLevel.n1;
        case 'N2':
          return JLPTLevel.n2;
        case 'N3':
          return JLPTLevel.n3;
        case 'N4':
          return JLPTLevel.n4;
        case 'N5':
        default:
          return JLPTLevel.n5;
      }
    }

    // Parse Course Type (backend might not have this, default to vod)
    CourseType parseType(String? type) {
      if (type == null) return CourseType.vod;
      switch (type.toLowerCase()) {
        case 'liveclass':
        case 'live_class':
        case 'live':
          return CourseType.liveClass;
        default:
          return CourseType.vod;
      }
    }

    // Parse learning outcomes and requirements from JSON
    List<String> parseJsonArray(dynamic data) {
      if (data == null) return [];
      if (data is List) {
        return data.map((e) => e.toString()).toList();
      }
      if (data is String) {
        try {
          final parsed = jsonDecode(data) as List;
          return parsed.map((e) => e.toString()).toList();
        } catch (_) {
          return [data];
        }
      }
      return [];
    }

    // Handle both instructorName and createdBy fields for backward compatibility
    final instructorName = json['instructorName'] as String? ?? 
                          json['createdBy'] as String? ?? 
                          'Unknown Instructor';
    
    // Handle both instructorAvatarUrl and generate from instructorName/createdBy
    final instructorAvatarUrl = json['instructorAvatarUrl'] as String? ?? 
                               'https://i.pravatar.cc/150?u=$instructorName';

    // Handle description - try description first, then shortDescription
    final description = json['description'] as String? ?? 
                       json['shortDescription'] as String? ?? '';

    return Course(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      slug: json['slug'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String? ?? 
                    'https://via.placeholder.com/400x225',
      previewVideoUrl: json['previewVideoUrl'] as String?,
      instructorName: instructorName,
      instructorAvatarUrl: instructorAvatarUrl,
      level: parseLevel(json['jlptLevel'] as String?),
      type: parseType(json['type'] as String?),
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPrice: (json['discountPrice'] as num?)?.toDouble(),
      rating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['totalReviews'] as int? ?? 0,
      enrolledCount: json['totalStudents'] as int? ?? 0,
      totalLessons: json['totalLessons'] as int? ?? 0,
      totalQuizzes: json['totalQuizzes'] as int? ?? 0,
      durationWeeks: json['durationWeeks'] as int?,
      isEnrolled: json['isEnrolled'] as bool? ?? false,
      isFree: json['isFree'] as bool? ?? false,
      featured: json['featured'] as bool? ?? false,
      description: description.isNotEmpty ? description : null,
      shortDescription: json['shortDescription'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      learningOutcomes: parseJsonArray(json['learningOutcomes']),
      requirements: parseJsonArray(json['requirements']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'thumbnailUrl': thumbnailUrl,
      'previewVideoUrl': previewVideoUrl,
      'instructorName': instructorName,
      'instructorAvatarUrl': instructorAvatarUrl,
      'jlptLevel': level.name.replaceAll('n', 'N'),
      'type': type == CourseType.vod ? 'vod' : 'liveClass',
      'price': price,
      'discountPrice': discountPrice,
      'averageRating': rating,
      'totalReviews': reviewCount,
      'totalStudents': enrolledCount,
      'totalLessons': totalLessons,
      'totalQuizzes': totalQuizzes,
      'durationWeeks': durationWeeks,
      'isEnrolled': isEnrolled,
      'isFree': isFree,
      'featured': featured,
      'description': description,
      'shortDescription': shortDescription,
      'tags': tags,
      'learningOutcomes': learningOutcomes,
      'requirements': requirements,
    };
  }

  String get priceLabel {
    if (isFree) return 'Free';
    if (discountPrice != null && discountPrice! < price) {
      return '${_formatVND(discountPrice!)} VNĐ';
    }
    return '${_formatVND(price)} VNĐ';
  }

  String get originalPriceLabel {
    if (isFree) return 'Free';
    if (discountPrice != null && discountPrice! < price) {
      return '${_formatVND(price)} VNĐ';
    }
    return '';
  }

  // Format number as VND (Vietnamese Dong) - no decimals, dot as thousand separator
  String _formatVND(double amount) {
    // Convert to integer (no decimals for VND)
    final intValue = amount.toInt();
    // Format with dot as thousand separator
    return intValue.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  bool get hasDiscount => discountPrice != null && discountPrice! < price;
  
  String get levelLabel => level.name.toUpperCase();
  
  String get typeLabel => type == CourseType.vod ? 'Video Course' : 'Live Class';
}
