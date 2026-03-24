import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/blog_repository.dart';
import '../../data/repositories/academy_repository.dart';
import '../../data/repositories/notification_repository.dart';
import '../../data/repositories/gamification_repository.dart'
    show GamificationRepository, LeaderboardData;
import '../../data/repositories/comment_repository.dart';
import '../../data/models/blog_model.dart';
import '../../data/models/academy_models.dart';
import '../../data/models/notification_model.dart';
import '../../data/models/gamification_models.dart';
import '../../data/models/live_schedule_model.dart';
import '../../data/models/class_catalog_model.dart';
import '../../data/models/checkout_models.dart';
import '../../data/models/study_set_models.dart';
import '../../core/models/paginated_response.dart';
import '../../features/auth/providers/auth_providers.dart';
import '../../features/auth/models/auth_state.dart';

/// Re-expose API client for repositories that need Dio
final dioForApiProvider = Provider((ref) {
  return ref.watch(apiClientProvider).client;
});

/// Chỉ gọi API cá nhân (enrollments trên Home, streak, …) khi đã đăng nhập và đã onboard — tránh gọi khi đang redirect sang khảo sát.
bool _personalizedApisAllowed(Ref ref) {
  final auth = ref.watch(authStateProvider).valueOrNull;
  return auth?.status == AuthStatus.authenticated &&
      auth?.user != null &&
      auth!.user!.isOnboarded;
}

/// Chỉ cần đã đăng nhập (có token + user). Dùng cho lịch live: user đã login nhưng chưa onboard vẫn tải được lịch.
bool _authenticatedAcademyUser(Ref ref) {
  final auth = ref.watch(authStateProvider).valueOrNull;
  return auth?.status == AuthStatus.authenticated && auth?.user != null;
}

// ---------- Repositories ----------
final blogRepositoryProvider = Provider<BlogRepository>((ref) {
  return BlogRepository(ref.watch(dioForApiProvider));
});

final academyRepositoryProvider = Provider<AcademyRepository>((ref) {
  return AcademyRepository(ref.watch(dioForApiProvider));
});

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository(ref.watch(dioForApiProvider));
});

final commentRepositoryProvider = Provider<CommentRepository>((ref) {
  return CommentRepository(ref.watch(dioForApiProvider));
});

final gamificationRepositoryProvider = Provider<GamificationRepository>((ref) {
  return GamificationRepository(ref.watch(dioForApiProvider));
});

// ---------- Blog data ----------
final blogListProvider = FutureProvider<PaginatedResponse<BlogModel>>((
  ref,
) async {
  final repo = ref.watch(blogRepositoryProvider);
  return repo.getBlogs(page: 1, limit: 20);
});

final blogDetailBySlugProvider = FutureProvider.family<BlogModel?, String>((
  ref,
  slug,
) async {
  final repo = ref.watch(blogRepositoryProvider);
  return repo.getBlogBySlug(slug);
});

final blogDetailByIdProvider = FutureProvider.family<BlogModel?, String>((
  ref,
  id,
) async {
  final repo = ref.watch(blogRepositoryProvider);
  return repo.getBlogById(id);
});

// ---------- Academy data (catalog theo lớp) ----------
String _catalogMonthYYYYMM() {
  final n = DateTime.now();
  return '${n.year}-${n.month.toString().padLeft(2, '0')}';
}

/// LIVE — kỳ trong tháng hiện tại (backend filter theo `month`).
final classCatalogLiveProvider = FutureProvider.autoDispose
    .family<List<ClassCatalogItemModel>, String?>((ref, level) async {
      final repo = ref.watch(academyRepositoryProvider);
      return repo.getPublicClassCatalog(
        mode: 'LIVE',
        level: level,
        month: _catalogMonthYYYYMM(),
      );
    });

final classCatalogVodProvider = FutureProvider.autoDispose
    .family<List<ClassCatalogItemModel>, String?>((ref, level) async {
      final repo = ref.watch(academyRepositoryProvider);
      return repo.getPublicClassCatalog(mode: 'VOD', level: level);
    });

final classCatalogLiveDetailProvider = FutureProvider.autoDispose
    .family<ClassCatalogDetailModel?, String>((ref, classId) async {
      final repo = ref.watch(academyRepositoryProvider);
      return repo.getPublicClassCatalogById(classId, mode: 'LIVE');
    });

final classCatalogVodDetailProvider = FutureProvider.autoDispose
    .family<ClassCatalogDetailModel?, String>((ref, classId) async {
      final repo = ref.watch(academyRepositoryProvider);
      return repo.getPublicClassCatalogById(classId, mode: 'VOD');
    });

final myEnrollmentsProvider =
    FutureProvider<PaginatedResponse<EnrollmentModel>>((ref) async {
      if (!_personalizedApisAllowed(ref)) {
        return const PaginatedResponse<EnrollmentModel>(
          data: [],
          total: 0,
          page: 1,
          limit: 50,
          totalPages: 1,
        );
      }
      final repo = ref.watch(academyRepositoryProvider);
      return repo.getMyEnrollments(limit: 50);
    });

/// Tiến độ bài học theo lớp (`lessonId` đã hoàn thành) — cần `classId` từ enrollment.
final classCompletedLessonIdsProvider = FutureProvider.autoDispose
    .family<List<String>, String>((ref, classId) async {
      if (!_personalizedApisAllowed(ref) || classId.isEmpty) {
        return const [];
      }
      final repo = ref.watch(academyRepositoryProvider);
      return repo.getCompletedLessonIds(classId);
    });

final myOrdersProvider = FutureProvider<PaginatedResponse<OrderModel>>((
  ref,
) async {
  final repo = ref.watch(academyRepositoryProvider);
  return repo.getMyOrders(limit: 50);
});

final orderDetailProvider = FutureProvider.family<OrderModel?, String>((
  ref,
  id,
) async {
  final repo = ref.watch(academyRepositoryProvider);
  return repo.getMyOrderById(id);
});

final orderFulfillmentByCodeProvider =
    FutureProvider.family<OrderFulfillmentSummaryModel?, String>((
      ref,
      orderCode,
    ) async {
      final repo = ref.watch(academyRepositoryProvider);
      return repo.getOrderFulfillmentByCode(orderCode);
    });

// ---------- Notifications ----------
final notificationsListProvider =
    FutureProvider<PaginatedResponse<NotificationModel>>((ref) async {
      final repo = ref.watch(notificationRepositoryProvider);
      return repo.getNotifications(page: 1, limit: 50);
    });

final notificationsUnreadCountProvider = FutureProvider<int>((ref) async {
  if (!_personalizedApisAllowed(ref)) {
    return 0;
  }
  final repo = ref.watch(notificationRepositoryProvider);
  return repo.getUnreadCount();
});

// ---------- Gamification ----------
final gamificationProfileProvider = FutureProvider<GamificationProfileModel?>((
  ref,
) async {
  final repo = ref.watch(gamificationRepositoryProvider);
  return repo.getProfile();
});

final leaderboardProvider = FutureProvider<LeaderboardData?>((ref) async {
  final repo = ref.watch(gamificationRepositoryProvider);
  return repo.getLeaderboard(type: 'global');
});

final gamificationAchievementsProvider = FutureProvider<List<AchievementModel>>(
  (ref) async {
    final repo = ref.watch(gamificationRepositoryProvider);
    return repo.getAchievements();
  },
);

final streakProvider = FutureProvider<StreakModel?>((ref) async {
  if (!_personalizedApisAllowed(ref)) {
    return null;
  }
  final repo = ref.watch(gamificationRepositoryProvider);
  return repo.getStreak();
});

// ---------- Live schedules: GET /api/academy/live-sessions/me (parity web-learner) ----------
final liveSchedulesProvider = FutureProvider<List<LiveScheduleModel>>((
  ref,
) async {
  if (!_authenticatedAcademyUser(ref)) {
    return const <LiveScheduleModel>[];
  }
  final repo = ref.watch(academyRepositoryProvider);
  return repo.getLiveSchedules();
});

// ---------- Study sets ----------
final studySetsProvider = FutureProvider<List<StudySetModel>>((ref) async {
  final repo = ref.watch(academyRepositoryProvider);
  return repo.getStudySets();
});

final studySetDetailProvider =
    FutureProvider.family<Map<String, dynamic>?, String>((ref, id) async {
      final repo = ref.watch(academyRepositoryProvider);
      return repo.getStudySetById(id);
    });

final studyCardsProvider = FutureProvider.family<List<SetCardModel>, String>((
  ref,
  setId,
) async {
  final repo = ref.watch(academyRepositoryProvider);
  return repo.getStudyCards(setId);
});
