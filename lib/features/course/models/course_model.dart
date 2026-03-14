/// Course = view model built from CourseOffering (commerce) + primary Class + CourseProfile + instructor.
/// Source: GET /api/academy/course-offerings/public (items) or public/:id (item), or GET /api/academy/enrollments/me (items).
/// Prisma: CourseOffering, CourseOfferingClass, Class, CourseProfile, User (instructor). No legacy fields.

enum CourseOfferingMode { vod, live }

enum JLPTLevel { n1, n2, n3, n4, n5 }

class Course {
  final String id;
  final String? classId;
  final String title;
  final String? code;
  final String? thumbnailUrl;
  final String instructorName;
  final String instructorAvatarUrl;
  final JLPTLevel level;
  final CourseOfferingMode mode;
  final double price;
  final double? salePrice;
  final bool isEnrolled;
  final bool isFree;
  final String? description;
  final DateTime? expiresAt;

  const Course({
    required this.id,
    this.classId,
    required this.title,
    this.code,
    this.thumbnailUrl,
    required this.instructorName,
    required this.instructorAvatarUrl,
    required this.level,
    required this.mode,
    required this.price,
    this.salePrice,
    this.isEnrolled = false,
    this.isFree = false,
    this.description,
    this.expiresAt,
  });

  /// From GET /api/academy/course-offerings/public response item.
  /// Shape: { id, code, title, description, price, salePrice, currency, mode, classes: [{ isPrimary, class: { id, name, courseProfile: { level, thumbnailUrl }, instructor: { displayName, avatarUrl } } }] }
  factory Course.fromOfferingJson(Map<String, dynamic> offering) {
    final classes = offering['classes'] as List<dynamic>? ?? [];
    Map<String, dynamic>? classData;
    for (final c in classes) {
      if (c is! Map<String, dynamic>) continue;
      final cls = c['class'];
      if (cls is! Map<String, dynamic>) continue;
      if (c['isPrimary'] == true) {
        classData = cls;
        break;
      }
      classData ??= cls;
    }
    classData ??= <String, dynamic>{};
    final courseProfile = classData['courseProfile'] as Map<String, dynamic>? ?? {};
    final instructor = classData['instructor'] as Map<String, dynamic>? ?? {};

    final price = _parseDouble(offering['price']) ?? 0.0;
    final salePrice = _parseDouble(offering['salePrice']);
    final levelStr = (courseProfile['level'] ?? '').toString().trim().toUpperCase();
    final level = _levelFromString(levelStr);
    final modeStr = (offering['mode'] ?? classData['mode'] ?? 'VOD').toString().toUpperCase();
    final mode = modeStr == 'LIVE' ? CourseOfferingMode.live : CourseOfferingMode.vod;
    final instructorName = instructor['displayName']?.toString() ?? 'Instructor';
    final avatarUrl = instructor['avatarUrl']?.toString();
    final instructorAvatarUrl = avatarUrl != null && avatarUrl.isNotEmpty
        ? avatarUrl
        : 'https://i.pravatar.cc/150?u=${Uri.encodeComponent(instructorName)}';

    return Course(
      id: offering['id']?.toString() ?? '',
      classId: classData['id']?.toString(),
      title: offering['title']?.toString() ?? classData['name']?.toString() ?? '',
      code: offering['code']?.toString(),
      thumbnailUrl: courseProfile['thumbnailUrl']?.toString(),
      instructorName: instructorName,
      instructorAvatarUrl: instructorAvatarUrl,
      level: level,
      mode: mode,
      price: price,
      salePrice: salePrice != null && salePrice > 0 && salePrice < price ? salePrice : null,
      isEnrolled: false,
      isFree: price == 0,
      description: offering['description']?.toString(),
      expiresAt: null,
    );
  }

  /// From GET /api/academy/enrollments/me response item (enriched by academy).
  factory Course.fromEnrollmentJson(Map<String, dynamic> e) {
    final title = e['courseTitle']?.toString() ?? 'Khóa học';
    final instructorName = e['instructorName']?.toString() ?? 'Instructor';
    return Course(
      id: e['offeringId']?.toString() ?? e['classId']?.toString() ?? '',
      classId: e['classId']?.toString(),
      title: title,
      code: null,
      thumbnailUrl: e['thumbnailUrl']?.toString(),
      instructorName: instructorName,
      instructorAvatarUrl: e['instructorAvatar']?.toString() ?? 'https://i.pravatar.cc/150?u=$instructorName',
      level: JLPTLevel.n5,
      mode: CourseOfferingMode.vod,
      price: 0,
      salePrice: null,
      isEnrolled: true,
      isFree: false,
      description: null,
      expiresAt: e['expiresAt'] != null ? DateTime.tryParse(e['expiresAt'].toString()) : null,
    );
  }

  static double? _parseDouble(dynamic v) {
    if (v == null) return null;
    if (v is num) return v.toDouble();
    return double.tryParse(v.toString());
  }

  static JLPTLevel _levelFromString(String s) {
    final n = RegExp(r'N[1-5]').firstMatch(s.trim().toUpperCase())?.group(0) ?? 'N5';
    switch (n) {
      case 'N1': return JLPTLevel.n1;
      case 'N2': return JLPTLevel.n2;
      case 'N3': return JLPTLevel.n3;
      case 'N4': return JLPTLevel.n4;
      default: return JLPTLevel.n5;
    }
  }

  String get priceLabel {
    if (isFree) return 'Free';
    if (salePrice != null && salePrice! < price) return '${_formatVND(salePrice!)} VNĐ';
    return '${_formatVND(price)} VNĐ';
  }

  String get originalPriceLabel {
    if (isFree) return '';
    if (salePrice != null && salePrice! < price) return '${_formatVND(price)} VNĐ';
    return '';
  }

  static String _formatVND(double amount) {
    final intValue = amount.toInt();
    return intValue.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  bool get hasDiscount => salePrice != null && salePrice! > 0 && salePrice! < price;
  String get levelLabel => level.name.toUpperCase().replaceAll('n', 'N');
  String get typeLabel => mode == CourseOfferingMode.live ? 'Live Class' : 'Video Course';

  // UI compatibility (derived): use where views expect old names
  String? get slug => code;
  double? get discountPrice => salePrice;
  bool get isLive => mode == CourseOfferingMode.live;
  double get rating => 0;
  int get reviewCount => 0;
  int get enrolledCount => 0;
  int get totalLessons => 0;
  int get totalQuizzes => 0;
}
