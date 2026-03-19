/// Gamification profile from GET /api/gamification/profile
class GamificationProfileModel {
  final String id;
  final String userId;
  final int level;
  final int currentXp;
  final int totalXp;
  final int points;
  final int gems;
  final int currentStreak;
  final int longestStreak;
  final String? lastActiveDate;
  final int freezeCount;
  final int totalActiveDays;
  final int weeklyActiveCount;
  final int monthlyActiveCount;
  final DateTime updatedAt;

  const GamificationProfileModel({
    required this.id,
    required this.userId,
    required this.level,
    required this.currentXp,
    required this.totalXp,
    required this.points,
    required this.gems,
    required this.currentStreak,
    required this.longestStreak,
    this.lastActiveDate,
    required this.freezeCount,
    required this.totalActiveDays,
    required this.weeklyActiveCount,
    required this.monthlyActiveCount,
    required this.updatedAt,
  });

  factory GamificationProfileModel.fromJson(Map<String, dynamic> json) {
    return GamificationProfileModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      level: (json['level'] as num?)?.toInt() ?? 0,
      currentXp: (json['currentXp'] as num?)?.toInt() ?? 0,
      totalXp: (json['totalXp'] as num?)?.toInt() ?? 0,
      points: (json['points'] as num?)?.toInt() ?? 0,
      gems: (json['gems'] as num?)?.toInt() ?? 0,
      currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
      longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
      lastActiveDate: json['lastActiveDate'] as String?,
      freezeCount: (json['freezeCount'] as num?)?.toInt() ?? 0,
      totalActiveDays: (json['totalActiveDays'] as num?)?.toInt() ?? 0,
      weeklyActiveCount: (json['weeklyActiveCount'] as num?)?.toInt() ?? 0,
      monthlyActiveCount: (json['monthlyActiveCount'] as num?)?.toInt() ?? 0,
      updatedAt: DateTime.parse(json['updatedAt'].toString()),
    );
  }
}

/// Streak from GET /api/gamification/streak
class StreakModel {
  final int currentStreak;
  final int longestStreak;
  final int freezeCount;
  final bool isActiveToday;
  final bool willBreakTomorrow;
  final String? lastActiveDate;
  final int totalActiveDays;
  final int weeklyActiveCount;
  final int monthlyActiveCount;
  final List<String> recentActiveDates;
  final bool? shouldShowToast;

  const StreakModel({
    required this.currentStreak,
    required this.longestStreak,
    required this.freezeCount,
    required this.isActiveToday,
    required this.willBreakTomorrow,
    this.lastActiveDate,
    required this.totalActiveDays,
    required this.weeklyActiveCount,
    required this.monthlyActiveCount,
    this.recentActiveDates = const [],
    this.shouldShowToast,
  });

  factory StreakModel.fromJson(Map<String, dynamic> json) {
    return StreakModel(
      currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
      longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
      freezeCount: (json['freezeCount'] as num?)?.toInt() ?? 0,
      isActiveToday: json['isActiveToday'] as bool? ?? false,
      willBreakTomorrow: json['willBreakTomorrow'] as bool? ?? false,
      lastActiveDate: json['lastActiveDate'] as String?,
      totalActiveDays: (json['totalActiveDays'] as num?)?.toInt() ?? 0,
      weeklyActiveCount: (json['weeklyActiveCount'] as num?)?.toInt() ?? 0,
      monthlyActiveCount: (json['monthlyActiveCount'] as num?)?.toInt() ?? 0,
      recentActiveDates: (json['recentActiveDates'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
      shouldShowToast: json['shouldShowToast'] as bool?,
    );
  }
}

/// Achievement from GET /api/gamification/achievements
class AchievementModel {
  final String id;
  final String code;
  final String category;
  final String title;
  final String description;
  final String? icon;
  final bool isActive;
  final int orderIndex;
  final bool isUnlocked;
  final DateTime? unlockedAt;

  const AchievementModel({
    required this.id,
    required this.code,
    required this.category,
    required this.title,
    required this.description,
    this.icon,
    required this.isActive,
    required this.orderIndex,
    this.isUnlocked = false,
    this.unlockedAt,
  });

  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    final achievement = json['achievement'] as Map<String, dynamic>? ?? json;
    return AchievementModel(
      id: (json['id'] ?? achievement['id']) as String,
      code: (achievement['code'] ?? '') as String,
      category: (achievement['category'] ?? '') as String,
      title: (achievement['title'] ?? '') as String,
      description: (achievement['description'] ?? '') as String,
      icon: achievement['icon'] as String?,
      isActive: (achievement['isActive'] as bool?) ?? true,
      orderIndex: (achievement['orderIndex'] as num?)?.toInt() ?? 0,
      isUnlocked: (json['isUnlocked'] as bool?) ?? false,
      unlockedAt: json['unlockedAt'] != null
          ? DateTime.tryParse(json['unlockedAt'].toString())
          : null,
    );
  }
}

/// Leaderboard user from gamification history / leaderboard
class LeaderboardUserModel {
  final String id;
  final String displayName;
  final String? avatarUrl;
  final int xp;
  final int level;
  final int rank;
  final int? currentStreak;

  const LeaderboardUserModel({
    required this.id,
    required this.displayName,
    this.avatarUrl,
    required this.xp,
    required this.level,
    required this.rank,
    this.currentStreak,
  });

  factory LeaderboardUserModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardUserModel(
      id: json['id'] as String,
      displayName: json['displayName'] as String? ?? 'Học viên',
      avatarUrl: json['avatarUrl'] as String?,
      xp: (json['xp'] as num?)?.toInt() ?? (json['totalXp'] as num?)?.toInt() ?? 0,
      level: (json['level'] as num?)?.toInt() ?? 1,
      rank: (json['rank'] as num?)?.toInt() ?? 0,
      currentStreak: (json['currentStreak'] as num?)?.toInt(),
    );
  }
}
