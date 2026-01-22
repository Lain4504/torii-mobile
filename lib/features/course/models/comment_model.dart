/// Comment model
class Comment {
  final String id;
  final String postId;
  final String userId;
  final String content;
  final String? parentCommentId;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  // Author details
  final String? authorDisplayName;
  final String? authorAvatarUrl;
  
  // Reply count
  final int replyCount;
  
  // Nested replies
  final List<Comment> replies;

  const Comment({
    required this.id,
    required this.postId,
    required this.userId,
    required this.content,
    this.parentCommentId,
    required this.createdAt,
    required this.updatedAt,
    this.authorDisplayName,
    this.authorAvatarUrl,
    this.replyCount = 0,
    this.replies = const [],
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    final author = json['author'] as Map<String, dynamic>?;
    
    return Comment(
      id: json['id'] as String,
      postId: json['postId'] as String,
      userId: json['userId'] as String,
      content: json['content'] as String,
      parentCommentId: json['parentCommentId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      authorDisplayName: author?['displayName'] as String?,
      authorAvatarUrl: author?['avatarUrl'] as String?,
      replyCount: json['replyCount'] as int? ?? 0,
      replies: (json['replies'] as List<dynamic>?)
          ?.map((r) => Comment.fromJson(r as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'postId': postId,
      'userId': userId,
      'content': content,
      'parentCommentId': parentCommentId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'author': {
        'displayName': authorDisplayName,
        'avatarUrl': authorAvatarUrl,
      },
      'replyCount': replyCount,
      'replies': replies.map((r) => r.toJson()).toList(),
    };
  }

  /// Check if comment has replies
  bool get hasReplies => replyCount > 0 || replies.isNotEmpty;

  /// Check if comment is a reply
  bool get isReply => parentCommentId != null;
}
