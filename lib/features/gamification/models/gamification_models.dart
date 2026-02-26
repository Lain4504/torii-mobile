class LeaderboardUser {
  final String id;
  final String? displayName;
  final String? avatarUrl;
  final int xp;
  final int level;
  final int rank;
  final int currentStreak;

  const LeaderboardUser({
    required this.id,
    this.displayName,
    this.avatarUrl,
    required this.xp,
    required this.level,
    required this.rank,
    required this.currentStreak,
  });

  factory LeaderboardUser.fromJson(Map<String, dynamic> json) {
    return LeaderboardUser(
      id: json['id']?.toString() ?? '',
      displayName: json['displayName']?.toString(),
      avatarUrl: json['avatarUrl']?.toString(),
      xp: json['xp'] as int? ?? 0,
      level: json['level'] as int? ?? 1,
      rank: json['rank'] as int? ?? 0,
      currentStreak: json['currentStreak'] as int? ?? 0,
    );
  }
}

class LeaderboardResponse {
  final List<LeaderboardUser> users;
  final LeaderboardUser? currentUser;
  final int totalUsers;
  final String type;

  const LeaderboardResponse({
    required this.users,
    this.currentUser,
    required this.totalUsers,
    required this.type,
  });

  factory LeaderboardResponse.fromJson(Map<String, dynamic> json) {
    return LeaderboardResponse(
      users: (json['users'] as List? ?? [])
          .map((u) => LeaderboardUser.fromJson(u))
          .toList(),
      currentUser: json['currentUser'] != null 
          ? LeaderboardUser.fromJson(json['currentUser']) 
          : null,
      totalUsers: json['totalUsers'] as int? ?? 0,
      type: json['type']?.toString() ?? 'global',
    );
  }
}

class GamificationProfile {
  final int level;
  final int currentXp;
  final int totalXp;
  final int nextLevelXp;
  final int currentStreak;
  final int longestStreak;

  const GamificationProfile({
    required this.level,
    required this.currentXp,
    required this.totalXp,
    required this.nextLevelXp,
    required this.currentStreak,
    required this.longestStreak,
  });

  factory GamificationProfile.fromJson(Map<String, dynamic> json) {
    return GamificationProfile(
      level: json['level'] as int? ?? 1,
      currentXp: json['currentXp'] as int? ?? 0,
      totalXp: json['totalXp'] as int? ?? 0,
      nextLevelXp: json['nextLevelXp'] as int? ?? 100,
      currentStreak: json['currentStreak'] as int? ?? 0,
      longestStreak: json['longestStreak'] as int? ?? 0,
    );
  }
}

class UserAchievement {
  final String id;
  final String achievementId;
  final bool isUnlocked;
  final dynamic progress;
  final DateTime? unlockedAt;
  final Achievement achievement;

  const UserAchievement({
    required this.id,
    required this.achievementId,
    required this.isUnlocked,
    this.progress,
    this.unlockedAt,
    required this.achievement,
  });

  factory UserAchievement.fromJson(Map<String, dynamic> json) {
    return UserAchievement(
      id: json['id']?.toString() ?? '',
      achievementId: json['achievementId']?.toString() ?? '',
      isUnlocked: json['isUnlocked'] as bool? ?? false,
      progress: json['progress'],
      unlockedAt: json['unlockedAt'] != null ? DateTime.parse(json['unlockedAt'] as String) : null,
      achievement: Achievement.fromJson(json['achievement'] as Map<String, dynamic>),
    );
  }
}

class Achievement {
  final String id;
  final String code;
  final String category;
  final String title;
  final String description;
  final String icon;
  final Map<String, dynamic> requirements;
  final Map<String, dynamic> rewards;
  final bool isActive;
  final int orderIndex;

  const Achievement({
    required this.id,
    required this.code,
    required this.category,
    required this.title,
    required this.description,
    required this.icon,
    required this.requirements,
    required this.rewards,
    required this.isActive,
    required this.orderIndex,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return Achievement(
      id: json['id']?.toString() ?? '',
      code: json['code']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      icon: json['icon']?.toString() ?? '',
      requirements: (json['requirements'] as Map<String, dynamic>?) ?? {},
      rewards: (json['rewards'] as Map<String, dynamic>?) ?? {},
      isActive: json['isActive'] as bool? ?? true,
      orderIndex: json['orderIndex'] as int? ?? 0,
    );
  }
}
