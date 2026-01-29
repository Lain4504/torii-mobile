/// Review Model - Data structures for reviews
class Review {
  final String id;
  final String userId;
  final String? courseId;
  final String? blogId;
  final int rating;
  final String? comment;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ReviewUser? user;

  Review({
    required this.id,
    required this.userId,
    this.courseId,
    this.blogId,
    required this.rating,
    this.comment,
    required this.createdAt,
    required this.updatedAt,
    this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] as String,
      userId: json['userId'] as String,
      courseId: json['courseId'] as String?,
      blogId: json['blogId'] as String?,
      rating: json['rating'] as int,
      comment: json['comment'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      user: json['user'] != null ? ReviewUser.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      if (courseId != null) 'courseId': courseId,
      if (blogId != null) 'blogId': blogId,
      'rating': rating,
      if (comment != null) 'comment': comment,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      if (user != null) 'user': user!.toJson(),
    };
  }

  /// Get time ago string (e.g., "2 days ago")
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }
}

/// Review User - User information in review
class ReviewUser {
  final String id;
  final String displayName;
  final String? avatarUrl;

  ReviewUser({required this.id, required this.displayName, this.avatarUrl});

  factory ReviewUser.fromJson(Map<String, dynamic> json) {
    return ReviewUser(
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      avatarUrl: json['avatarUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
    };
  }
}

/// Paginated Reviews Response
class PaginatedReviews {
  final List<Review> reviews;
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  PaginatedReviews({
    required this.reviews,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory PaginatedReviews.fromJson(Map<String, dynamic> json) {
    // Handle both direct list and paginated response
    if (json['data'] is List) {
      final list = json['data'] as List;
      return PaginatedReviews(
        reviews: list.map((e) => Review.fromJson(e)).toList(),
        total: json['meta']?['total'] ?? list.length,
        page: json['meta']?['page'] ?? 1,
        limit: json['meta']?['limit'] ?? list.length,
        totalPages: json['meta']?['totalPages'] ?? 1,
      );
    }

    // Standard paginated response
    final data = json['data'] ?? json;
    final meta = json['meta'] ?? {};

    return PaginatedReviews(
      reviews: (data as List).map((e) => Review.fromJson(e)).toList(),
      total: meta['total'] ?? 0,
      page: meta['page'] ?? 1,
      limit: meta['limit'] ?? 10,
      totalPages: meta['totalPages'] ?? 1,
    );
  }

  bool get hasMore => page < totalPages;
}

/// Rating Distribution
class RatingDistribution {
  final String courseId;
  final List<RatingCount> distribution;
  final double averageRating;
  final int totalReviews;

  RatingDistribution({
    required this.courseId,
    required this.distribution,
    required this.averageRating,
    required this.totalReviews,
  });

  factory RatingDistribution.fromJson(Map<String, dynamic> json) {
    return RatingDistribution(
      courseId: json['courseId'] as String,
      distribution: (json['distribution'] as List)
          .map((e) => RatingCount.fromJson(e))
          .toList(),
      averageRating: (json['averageRating'] as num).toDouble(),
      totalReviews: json['totalReviews'] as int,
    );
  }

  /// Get count for specific star rating
  int getCountForRating(int stars) {
    try {
      return distribution.firstWhere((d) => d.stars == stars).count;
    } catch (_) {
      return 0;
    }
  }

  /// Get percentage for specific star rating
  double getPercentForRating(int stars) {
    try {
      return distribution.firstWhere((d) => d.stars == stars).percent;
    } catch (_) {
      return 0.0;
    }
  }
}

/// Rating Count - Individual rating distribution
class RatingCount {
  final int stars;
  final int count;
  final double percent;

  RatingCount({
    required this.stars,
    required this.count,
    required this.percent,
  });

  factory RatingCount.fromJson(Map<String, dynamic> json) {
    return RatingCount(
      stars: json['stars'] as int,
      count: json['count'] as int,
      percent: (json['percent'] as num).toDouble(),
    );
  }
}
