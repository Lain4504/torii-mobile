/// Comment Model - Data structure for comments
class Comment {
  final String id;
  final String postId;
  final String userId;
  final String content;
  final String? parentId; // For nested comments
  final int likeCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CommentUser? author;
  final List<Comment>? replies;
  final int replyCount;

  Comment({
    required this.id,
    required this.postId,
    required this.userId,
    required this.content,
    this.parentId,
    this.likeCount = 0,
    required this.createdAt,
    required this.updatedAt,
    this.author,
    this.replies,
    this.replyCount = 0,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'] as String,
      postId: json['postId'] as String,
      userId:
          json['userId'] ?? json['authorId'] as String, // Handle alias if any
      content: json['content'] as String,
      parentId: json['parentCommentId'] ?? json['parentId'] as String?,
      likeCount: json['likeCount'] ?? json['likes'] ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      author: json['author'] != null
          ? CommentUser.fromJson(json['author'])
          : null,
      replies: json['replies'] != null
          ? (json['replies'] as List).map((e) => Comment.fromJson(e)).toList()
          : null,
      replyCount: json['_count']?['replies'] ?? json['replyCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'postId': postId,
      'userId': userId,
      'content': content,
      if (parentId != null) 'parentCommentId': parentId,
      'likeCount': likeCount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      if (author != null) 'author': author!.toJson(),
      if (replies != null) 'replies': replies!.map((e) => e.toJson()).toList(),
      'replyCount': replyCount,
    };
  }

  /// Get time ago string
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

/// Comment User - User information in comment
class CommentUser {
  final String id;
  final String displayName;
  final String? avatarUrl;

  CommentUser({required this.id, required this.displayName, this.avatarUrl});

  factory CommentUser.fromJson(Map<String, dynamic> json) {
    return CommentUser(
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

/// Paginated Comments Response
class PaginatedComments {
  final List<Comment> comments;
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  PaginatedComments({
    required this.comments,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory PaginatedComments.fromJson(Map<String, dynamic> json) {
    // Handle both direct list and paginated response
    if (json['data'] is List) {
      final list = json['data'] as List;
      return PaginatedComments(
        comments: list.map((e) => Comment.fromJson(e)).toList(),
        total: json['meta']?['total'] ?? list.length,
        page: json['meta']?['page'] ?? 1,
        limit: json['meta']?['limit'] ?? list.length,
        totalPages: json['meta']?['totalPages'] ?? 1,
      );
    }

    // Standard paginated response
    // Sometimes 'data' is inside 'data' again depending on wrapper
    // Check postCommentApi.findAll: returns { data: [...], total, ... } directly as response.data
    // CommentService uses ApiResponse.fromJson which extracts response.data into 'json' argument

    final commentsData = json['data'] ?? json['comments'] ?? [];

    return PaginatedComments(
      comments: (commentsData as List).map((e) => Comment.fromJson(e)).toList(),
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['totalPages'] ?? 0,
    );
  }

  bool get hasMore => page < totalPages;
}
