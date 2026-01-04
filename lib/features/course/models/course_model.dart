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

  String get priceLabel => price == 0 ? 'Free' : '\$${price.toStringAsFixed(2)}';
  
  String get levelLabel => level.name.toUpperCase();
  
  String get typeLabel => type == CourseType.vod ? 'Video Course' : 'Live Class';
}
