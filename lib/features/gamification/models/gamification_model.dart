import 'dart:convert';

enum GamificationTransactionType { earn, redeem, bonus, expiration, other }

enum ActivityType {
  lessonComplete,
  quizAnswer,
  videoWatch,
  review,
  practice,
  flashcardReview,
  examComplete,
  blogCreate,
  commentCreate,
  login,
}

class UserGamification {
  final String id;
  final String userId;
  final int level;
  final int currentXp;
  final int totalXp;
  final int points;
  final int gems;
  final int? balance;
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastActiveDate;
  final int freezeCount;
  final int totalActiveDays;
  final int weeklyActiveCount;
  final int monthlyActiveCount;
  final DateTime updatedAt;

  const UserGamification({
    required this.id,
    required this.userId,
    required this.level,
    required this.currentXp,
    required this.totalXp,
    required this.points,
    required this.gems,
    this.balance,
    required this.currentStreak,
    required this.longestStreak,
    this.lastActiveDate,
    required this.freezeCount,
    required this.totalActiveDays,
    required this.weeklyActiveCount,
    required this.monthlyActiveCount,
    required this.updatedAt,
  });

  factory UserGamification.fromJson(Map<String, dynamic> json) {
    return UserGamification(
      id: json['id'] as String,
      userId: json['userId'] as String,
      level: json['level'] as int,
      currentXp: json['currentXp'] as int,
      totalXp: json['totalXp'] as int,
      points: json['points'] as int,
      gems: json['gems'] as int,
      balance: json['balance'] as int?,
      currentStreak: json['currentStreak'] as int,
      longestStreak: json['longestStreak'] as int,
      lastActiveDate: json['lastActiveDate'] != null ? DateTime.parse(json['lastActiveDate'] as String) : null,
      freezeCount: json['freezeCount'] as int,
      totalActiveDays: json['totalActiveDays'] as int,
      weeklyActiveCount: json['weeklyActiveCount'] as int,
      monthlyActiveCount: json['monthlyActiveCount'] as int,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'level': level,
      'currentXp': currentXp,
      'totalXp': totalXp,
      'points': points,
      'gems': gems,
      'balance': balance,
      'currentStreak': currentStreak,
      'longestStreak': longestStreak,
      'lastActiveDate': lastActiveDate?.toIso8601String(),
      'freezeCount': freezeCount,
      'totalActiveDays': totalActiveDays,
      'weeklyActiveCount': weeklyActiveCount,
      'monthlyActiveCount': monthlyActiveCount,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class GamificationHistory {
  final String id;
  final String userId;
  final int amount;
  final GamificationTransactionType type;
  final ActivityType? activityType;
  final String? description;
  final Map<String, dynamic> metadata;
  final DateTime createdAt;

  const GamificationHistory({
    required this.id,
    required this.userId,
    required this.amount,
    required this.type,
    this.activityType,
    this.description,
    this.metadata = const {},
    required this.createdAt,
  });

  factory GamificationHistory.fromJson(Map<String, dynamic> json) {
    GamificationTransactionType parseType(String type) {
      switch (type.toUpperCase()) {
        case 'EARN': return GamificationTransactionType.earn;
        case 'REDEEM': return GamificationTransactionType.redeem;
        case 'BONUS': return GamificationTransactionType.bonus;
        case 'EXPIRATION': return GamificationTransactionType.expiration;
        default: return GamificationTransactionType.other;
      }
    }

    ActivityType? parseActivityType(String? type) {
      if (type == null) return null;
      switch (type.toUpperCase()) {
        case 'LESSON_COMPLETE': return ActivityType.lessonComplete;
        case 'QUIZ_ANSWER': return ActivityType.quizAnswer;
        case 'VIDEO_WATCH': return ActivityType.videoWatch;
        case 'REVIEW': return ActivityType.review;
        case 'PRACTICE': return ActivityType.practice;
        case 'FLASHCARD_REVIEW': return ActivityType.flashcardReview;
        case 'EXAM_COMPLETE': return ActivityType.examComplete;
        case 'BLOG_CREATE': return ActivityType.blogCreate;
        case 'COMMENT_CREATE': return ActivityType.commentCreate;
        case 'LOGIN': return ActivityType.login;
        default: return null;
      }
    }

    return GamificationHistory(
      id: json['id'] as String,
      userId: json['userId'] as String,
      amount: json['amount'] as int,
      type: parseType(json['type'] as String),
      activityType: parseActivityType(json['activityType'] as String?),
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? {},
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}

class PointReward {
  final String id;
  final String name;
  final String? description;
  final int points;
  final String discountType; // 'percentage' | 'fixed_amount'
  final double discountValue;
  final double? maxDiscountAmount;
  final double? minOrderAmount;
  final int validDuration;
  final bool isActive;

  const PointReward({
    required this.id,
    required this.name,
    this.description,
    required this.points,
    required this.discountType,
    required this.discountValue,
    this.maxDiscountAmount,
    this.minOrderAmount,
    required this.validDuration,
    required this.isActive,
  });

  factory PointReward.fromJson(Map<String, dynamic> json) {
    return PointReward(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      points: json['points'] as int,
      discountType: json['discountType'] as String,
      discountValue: (json['discountValue'] as num).toDouble(),
      maxDiscountAmount: (json['maxDiscountAmount'] as num?)?.toDouble(),
      minOrderAmount: (json['minOrderAmount'] as num?)?.toDouble(),
      validDuration: json['validDuration'] as int,
      isActive: json['isActive'] as bool? ?? true,
    );
  }
}
