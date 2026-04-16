class Instructor {
  final String id;
  final String displayName;
  final String? avatarUrl;
  final String? bio;
  final InstructorStats? stats;

  Instructor({
    required this.id,
    required this.displayName,
    this.avatarUrl,
    this.bio,
    this.stats,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    // API response profiles might have id/displayName or just name/id
    final id = (json['id'] ?? json['userId'] ?? '').toString();
    final displayName = json['displayName'] ?? 
                        json['name'] ?? 
                        json['fullName'] ?? 
                        json['full_name'] ?? 
                        json['userName'] ??
                        (json['user'] is Map ? (json['user']['displayName'] ?? json['user']['fullName'] ?? json['user']['name']) : null) ??
                        'Giảng viên';
    final avatarUrl = json['avatarUrl'] ?? json['image'] ?? (json['user'] is Map ? json['user']['avatarUrl'] : null);
    final bio = json['bio'] ?? json['description'] ?? json['shortDescription'];
    
    final statsJson = json['stats'] ?? json['_count'];
    InstructorStats? stats;
    if (statsJson is Map<String, dynamic>) {
      stats = InstructorStats.fromJson(statsJson);
    }

    return Instructor(
      id: id,
      displayName: displayName.toString(),
      avatarUrl: avatarUrl?.toString(),
      bio: bio?.toString(),
      stats: stats,
    );
  }
}

class InstructorStats {
  final int courseCount;
  final int studentCount;
  final double? rating;

  InstructorStats({
    this.courseCount = 0,
    this.studentCount = 0,
    this.rating,
  });

  factory InstructorStats.fromJson(Map<String, dynamic> json) {
    int toInt(dynamic v) => (v is num) ? v.toInt() : (int.tryParse(v?.toString() ?? '0') ?? 0);
    double? toDouble(dynamic v) => (v is num) ? v.toDouble() : double.tryParse(v?.toString() ?? '');

    return InstructorStats(
      courseCount: toInt(json['courses'] ?? json['courseCount'] ?? json['cohorts']),
      studentCount: toInt(json['students'] ?? json['studentCount'] ?? json['enrollments']),
      rating: toDouble(json['rating'] ?? json['averageRating']),
    );
  }
}
