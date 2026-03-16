import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/blog_repository.dart';
import '../../data/repositories/academy_repository.dart';
import '../../data/repositories/notification_repository.dart';
import '../../data/repositories/gamification_repository.dart' show GamificationRepository, LeaderboardData;
import '../../data/models/blog_model.dart';
import '../../data/models/academy_models.dart';
import '../../data/models/notification_model.dart';
import '../../data/models/gamification_models.dart';
import '../../data/models/live_schedule_model.dart';
import '../../core/models/paginated_response.dart';
import '../../features/auth/providers/auth_providers.dart';

/// Re-expose API client for repositories that need Dio
final dioForApiProvider = Provider((ref) {
  return ref.watch(apiClientProvider).client;
});

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

final gamificationRepositoryProvider = Provider<GamificationRepository>((ref) {
  return GamificationRepository(ref.watch(dioForApiProvider));
});

// ---------- Blog data ----------
final blogListProvider = FutureProvider<PaginatedResponse<BlogModel>>((ref) async {
  final repo = ref.watch(blogRepositoryProvider);
  return repo.getBlogs(page: 1, limit: 20);
});

final blogDetailBySlugProvider = FutureProvider.family<BlogModel?, String>((ref, slug) async {
  final repo = ref.watch(blogRepositoryProvider);
  return repo.getBlogBySlug(slug);
});

final blogDetailByIdProvider = FutureProvider.family<BlogModel?, String>((ref, id) async {
  final repo = ref.watch(blogRepositoryProvider);
  return repo.getBlogById(id);
});

// ---------- Academy data ----------
final publicCourseOfferingsProvider = FutureProvider<List<CourseOfferingModel>>((ref) async {
  final repo = ref.watch(academyRepositoryProvider);
  return repo.getPublicCourseOfferings();
});

final myEnrollmentsProvider = FutureProvider<PaginatedResponse<EnrollmentModel>>((ref) async {
  final repo = ref.watch(academyRepositoryProvider);
  return repo.getMyEnrollments(limit: 50);
});

final myOrdersProvider = FutureProvider<PaginatedResponse<OrderModel>>((ref) async {
  final repo = ref.watch(academyRepositoryProvider);
  return repo.getMyOrders(limit: 50);
});

final orderDetailProvider = FutureProvider.family<OrderModel?, String>((ref, id) async {
  final repo = ref.watch(academyRepositoryProvider);
  return repo.getMyOrderById(id);
});

final courseOfferingDetailProvider = FutureProvider.family<CourseOfferingModel?, String>((ref, id) async {
  final repo = ref.watch(academyRepositoryProvider);
  return repo.getPublicCourseOfferingById(id);
});

// ---------- Notifications ----------
final notificationsListProvider = FutureProvider<PaginatedResponse<NotificationModel>>((ref) async {
  final repo = ref.watch(notificationRepositoryProvider);
  return repo.getNotifications(page: 1, limit: 50);
});

final notificationsUnreadCountProvider = FutureProvider<int>((ref) async {
  final repo = ref.watch(notificationRepositoryProvider);
  return repo.getUnreadCount();
});

// ---------- Gamification ----------
final gamificationProfileProvider = FutureProvider<GamificationProfileModel?>((ref) async {
  final repo = ref.watch(gamificationRepositoryProvider);
  return repo.getProfile();
});

final leaderboardProvider = FutureProvider<LeaderboardData?>((ref) async {
  final repo = ref.watch(gamificationRepositoryProvider);
  return repo.getLeaderboard(type: 'global');
});

final gamificationAchievementsProvider = FutureProvider<List<AchievementModel>>((ref) async {
  final repo = ref.watch(gamificationRepositoryProvider);
  return repo.getAchievements();
});

// ---------- Live schedules ----------
final liveSchedulesProvider = FutureProvider<List<LiveScheduleModel>>((ref) async {
  final repo = ref.watch(academyRepositoryProvider);
  return repo.getLiveSchedules();
});
