enum CourseType { vod, liveClass }

enum JLPTLevel { n1, n2, n3, n4, n5 }

class Course {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String instructorName;
  final String instructorAvatarUrl;
  final JLPTLevel level;
  final CourseType type;
  final double price;
  final double rating;
  final int reviewCount;
  final int enrolledCount;
  final bool isEnrolled;
  final String description;

  const Course({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.instructorName,
    required this.instructorAvatarUrl,
    required this.level,
    required this.type,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.enrolledCount,
    this.isEnrolled = false,
    this.description = '',
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? 'https://via.placeholder.com/400x225',
      instructorName: json['createdBy'] ?? 'Unknown Instructor',
      instructorAvatarUrl: 'https://i.pravatar.cc/150?u=${json['createdBy'] ?? 'default'}',
      level: _parseJLPTLevel(json['jlptLevel']),
      type: CourseType.vod, // Default to VOD for now
      price: (json['price'] ?? 0).toDouble(),
      rating: (json['averageRating'] ?? 0).toDouble(),
      reviewCount: json['totalReviews'] ?? 0,
      enrolledCount: json['totalStudents'] ?? 0,
      isEnrolled: json['isEnrolled'] ?? false,
      description: json['description'] ?? json['shortDescription'] ?? '',
    );
  }

  static JLPTLevel _parseJLPTLevel(String? level) {
    if (level == null) return JLPTLevel.n5;
    switch (level.toUpperCase()) {
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

  String get priceLabel => price == 0 ? 'Free' : '\$${price.toStringAsFixed(2)}';
  
  String get levelLabel => level.name.toUpperCase();
  
  String get typeLabel => type == CourseType.vod ? 'Video Course' : 'Live Class';
}
