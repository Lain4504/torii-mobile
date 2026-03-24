class CommentAuthorModel {
  final String id;
  final String displayName;
  final String? avatarUrl;

  const CommentAuthorModel({
    required this.id,
    required this.displayName,
    this.avatarUrl,
  });

  factory CommentAuthorModel.fromJson(Map<String, dynamic> json) {
    return CommentAuthorModel(
      id: (json['id'] ?? '').toString(),
      displayName: (json['displayName'] ?? '').toString(),
      avatarUrl: json['avatarUrl']?.toString(),
    );
  }
}

class CommentModel {
  final String id;
  final String userId;
  final String? parentCommentId;
  final String content;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CommentAuthorModel? author;
  final int replyCount;
  final int likeCount;
  final bool isLiked;
  final List<CommentModel> replies;

  const CommentModel({
    required this.id,
    required this.userId,
    required this.parentCommentId,
    required this.content,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.author,
    required this.replyCount,
    required this.likeCount,
    required this.isLiked,
    required this.replies,
  });

  static DateTime _parseDate(dynamic v) {
    if (v == null) return DateTime.fromMillisecondsSinceEpoch(0);
    if (v is DateTime) return v;
    return DateTime.tryParse(v.toString()) ?? DateTime.fromMillisecondsSinceEpoch(0);
  }

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    final repliesJson = (json['replies'] as List<dynamic>? ?? <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .toList();

    return CommentModel(
      id: (json['id'] ?? '').toString(),
      userId: (json['userId'] ?? json['user_id'] ?? '').toString(),
      parentCommentId: (json['parentCommentId'] ?? json['parentId'] ?? json['parent_comment_id'])
          ?.toString(),
      content: (json['content'] ?? '').toString(),
      status: (json['status'] ?? 'approved').toString(),
      createdAt: _parseDate(json['createdAt'] ?? json['created_at']),
      updatedAt: _parseDate(json['updatedAt'] ?? json['updated_at']),
      author: json['author'] is Map<String, dynamic>
          ? CommentAuthorModel.fromJson(json['author'] as Map<String, dynamic>)
          : null,
      replyCount: (json['replyCount'] ?? json['_count']?['replies'] ?? 0) is num
          ? (json['replyCount'] ?? json['_count']?['replies'] ?? 0).toInt()
          : int.tryParse((json['replyCount'] ?? '0').toString()) ?? 0,
      likeCount: (json['likeCount'] ?? json['_count']?['likes'] ?? 0) is num
          ? (json['likeCount'] ?? json['_count']?['likes'] ?? 0).toInt()
          : int.tryParse((json['likeCount'] ?? '0').toString()) ?? 0,
      isLiked: json['isLiked'] == true,
      replies: repliesJson.map((e) => CommentModel.fromJson(e)).toList(),
    );
  }
}

