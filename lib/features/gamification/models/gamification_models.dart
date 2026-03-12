class GamificationProfile {
  final int level;
  final int totalXp;
  final int currentStreak;
  final int longestStreak;

  GamificationProfile({
    required this.level,
    required this.totalXp,
    required this.currentStreak,
    required this.longestStreak,
  });

  factory GamificationProfile.fromJson(Map<String, dynamic> json) {
    // Backend may return nested structure: { level, xp, streak, ... }
    return GamificationProfile(
      level: (json['level'] ?? json['currentLevel'] ?? 0) as int,
      totalXp: (json['totalXp'] ?? json['xp'] ?? json['points'] ?? 0) as int,
      currentStreak:
          (json['currentStreak'] ?? json['streak'] ?? json['current_streak'] ?? 0)
              as int,
      longestStreak:
          (json['longestStreak'] ?? json['maxStreak'] ?? 0) as int,
    );
  }
}

class Achievement {
  final String id;
  final String title;
  final String description;
  final bool unlocked;

  Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.unlocked,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return Achievement(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      title: (json['title'] ?? json['name'] ?? 'Untitled').toString(),
      description: (json['description'] ?? json['desc'] ?? '').toString(),
      unlocked: (json['unlocked'] ??
              json['isUnlocked'] ??
              json['completed'] ??
              false) as bool,
    );
  }
}

