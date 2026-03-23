import 'live_product_detail_model.dart';

/// A class in the learner catalog — GET /api/academy/classes/public
class ClassCatalogItemModel {
  final String id;
  final String code;
  final String name;
  final String mode;
  final String? catalogProductId;
  final double catalogPrice;
  final String? catalogCurrency;
  final Map<String, dynamic>? courseProfile;
  final Map<String, dynamic>? cohort;
  final Map<String, dynamic>? instructor;
  final List<dynamic> liveSchedules;
  final Map<String, dynamic>? liveEnrollment;

  /// Alias for cohort (legacy support)
  Map<String, dynamic>? get term => cohort;

  const ClassCatalogItemModel({
    required this.id,
    required this.code,
    required this.name,
    required this.mode,
    this.catalogProductId,
    this.catalogPrice = 0,
    this.catalogCurrency,
    this.courseProfile,
    this.cohort,
    this.instructor,
    this.liveSchedules = const [],
    this.liveEnrollment,
  });

  factory ClassCatalogItemModel.fromJson(Map<String, dynamic> json) {
    final cp = json['courseProfile'];
    final c = json['cohort'] ?? json['term'];
    final ins = json['instructor'];
    final ls = json['liveSchedules'];
    final le = json['liveEnrollment'];

    final pid = json['catalogProductId']?.toString();

    Map<String, dynamic>? cohortMap;
    if (c is Map) {
      cohortMap = Map<String, dynamic>.from(c);
      // Normalize startDate -> openingDate for UI compatibility
      if (cohortMap['startDate'] != null && cohortMap['openingDate'] == null) {
        cohortMap['openingDate'] = cohortMap['startDate'];
      }
    }

    return ClassCatalogItemModel(
      id: (json['id'] ?? '').toString(),
      code: (json['code'] ?? '').toString(),
      name: (json['name'] ?? json['title'] ?? '').toString(),
      mode: (json['mode'] ?? 'VOD').toString(),
      catalogProductId: pid,
      catalogPrice: _parseDouble(json['catalogPrice']),
      catalogCurrency: json['catalogCurrency']?.toString(),
      courseProfile: cp is Map ? Map<String, dynamic>.from(cp) : null,
      cohort: cohortMap,
      instructor: ins is Map ? Map<String, dynamic>.from(ins) : null,
      liveSchedules: ls is List ? ls : const [],
      liveEnrollment: le is Map ? Map<String, dynamic>.from(le) : null,
    );
  }

  String? get jlptLevel => courseProfile?['level']?.toString();
  String? get profileTitle => courseProfile?['title']?.toString();
  String? get thumbnailUrl => courseProfile?['thumbnailUrl']?.toString();
  bool get isLive => mode.toUpperCase() == 'LIVE';
}

double _parseDouble(dynamic v) {
  if (v == null) return 0;
  if (v is num) return v.toDouble();
  return double.tryParse(v.toString()) ?? 0;
}

/// Class Detail — GET /api/academy/classes/public/:id (body is full class object + catalog* )
class ClassCatalogDetailModel {
  final Map<String, dynamic> raw;
  final ClassCatalogItemModel item;
  final String? descriptionHtml;
  final List<Map<String, dynamic>> modules;
  final List<Map<String, dynamic>> liveScheduleSessions;

  const ClassCatalogDetailModel({
    required this.raw,
    required this.item,
    this.descriptionHtml,
    this.modules = const [],
    this.liveScheduleSessions = const [],
  });

  factory ClassCatalogDetailModel.fromJson(Map<String, dynamic> json) {
    final cp = json['courseProfile'];
    Map<String, dynamic>? cpMap;
    if (cp is Map) cpMap = Map<String, dynamic>.from(cp);

    final modules = <Map<String, dynamic>>[];
    final rawMods = cpMap?['modules'];
    if (rawMods is List) {
      for (final m in rawMods) {
        if (m is Map) modules.add(Map<String, dynamic>.from(m));
      }
    }

    final sessions = <Map<String, dynamic>>[];
    final rawSess = json['liveScheduleSessions'];
    if (rawSess is List) {
      for (final s in rawSess) {
        if (s is Map) sessions.add(Map<String, dynamic>.from(s));
      }
    }

    final desc = cpMap?['description']?.toString();

    return ClassCatalogDetailModel(
      raw: Map<String, dynamic>.from(json),
      item: ClassCatalogItemModel.fromJson(json),
      descriptionHtml: desc,
      modules: modules,
      liveScheduleSessions: sessions,
    );
  }

  String get catalogProductId => item.catalogProductId ?? '';
  double get displayPrice => item.catalogPrice;
  bool get isLive => item.isLive;

  /// Parse capacity / enrollment similar to old flow
  LiveClassModel? get liveClass {
    try {
      return LiveClassModel.fromJson(raw);
    } catch (_) {
      return null;
    }
  }
}
