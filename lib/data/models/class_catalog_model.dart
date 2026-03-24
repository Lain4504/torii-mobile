import 'live_product_detail_model.dart';

/// Catalog item từ `GET /api/academy/live-classes/public`.
class ClassCatalogItemModel {
  final String id;
  final String code;
  final String name;
  final String mode;
  final String? catalogProductId;
  final String? cohortId;
  final double catalogPrice;
  final String? catalogCurrency;
  final Map<String, dynamic>? courseProfile;
  final Map<String, dynamic>? cohort;
  final Map<String, dynamic>? instructor;
  final List<dynamic> liveSchedules;
  final Map<String, dynamic>? liveEnrollment;

  /// Alias để tái sử dụng UI hiện có.
  Map<String, dynamic>? get term => cohort;

  const ClassCatalogItemModel({
    required this.id,
    required this.code,
    required this.name,
    required this.mode,
    this.catalogProductId,
    this.cohortId,
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
    final c = json['cohort'];
    final ins = json['instructor'];
    final ls = json['liveSchedules'];
    final mode = (json['mode'] ?? 'VOD').toString().toUpperCase();

    Map<String, dynamic>? cohortMap;
    if (c is Map) {
      cohortMap = Map<String, dynamic>.from(c);
    }

    final profileCandidate = mode == 'LIVE'
        ? (cohortMap?['courseProfile'] ?? cp)
        : cp;
    final cohortId = json['cohortId']?.toString();
    final price = mode == 'LIVE'
        ? _parseDouble(cohortMap?['price'])
        : _parseDouble(json['price']);
    final productId = mode == 'LIVE' ? cohortId : json['id']?.toString();

    return ClassCatalogItemModel(
      id: (json['id'] ?? '').toString(),
      code: (json['code'] ?? '').toString(),
      name:
          (mode == 'LIVE'
                  ? (json['name'] ?? '')
                  : (json['title'] ?? json['name'] ?? ''))
              .toString(),
      mode: mode,
      catalogProductId: productId,
      cohortId: cohortId,
      catalogPrice: price,
      catalogCurrency: 'VND',
      courseProfile: profileCandidate is Map
          ? Map<String, dynamic>.from(profileCandidate)
          : null,
      cohort: cohortMap,
      instructor: ins is Map ? Map<String, dynamic>.from(ins) : null,
      liveSchedules: ls is List ? ls : const [],
      liveEnrollment: null,
    );
  }

  String? get jlptLevel => courseProfile?['level']?.toString();
  String? get profileTitle => courseProfile?['title']?.toString();
  String? get thumbnailUrl => courseProfile?['thumbnailUrl']?.toString();
  DateTime? get openingDate {
    final raw =
        cohort?['openingDate'] ??
        cohort?['startDate'] ??
        cohort?['enrollmentOpenAt'];
    if (raw == null) return null;
    return DateTime.tryParse(raw.toString());
  }

  bool get isLive => mode.toUpperCase() == 'LIVE';
}

double _parseDouble(dynamic v) {
  if (v == null) return 0;
  if (v is num) return v.toDouble();
  return double.tryParse(v.toString()) ?? 0;
}

/// Class/Product detail từ `GET /api/academy/live-classes/public/:id?mode=...`
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
    final item = ClassCatalogItemModel.fromJson(json);
    final cp = item.courseProfile;
    final cpMap = cp == null ? null : Map<String, dynamic>.from(cp);

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
      item: item,
      descriptionHtml: desc,
      modules: modules,
      liveScheduleSessions: sessions,
    );
  }

  String get catalogProductId => item.catalogProductId ?? item.cohortId ?? '';
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
