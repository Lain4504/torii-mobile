import 'package:torii_app/data/models/auth_model.dart';

class Post {
  final String id;
  final User author;
  final String title;
  final String content;
  final String? imageUrl;
  final int likesCount;
  final int commentsCount;
  final DateTime createdAt;
  final bool isLiked;

  Post({
    required this.id,
    required this.author,
    required this.title,
    required this.content,
    this.imageUrl,
    this.likesCount = 0,
    this.commentsCount = 0,
    required this.createdAt,
    this.isLiked = false,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id']?.toString() ?? '',
      author: User.fromJson(json['user'] ?? json['author'] ?? {}),
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['imageUrl'],
      likesCount: json['likesCount'] ?? 0,
      commentsCount: json['commentsCount'] ?? 0,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      isLiked: json['isLiked'] ?? false,
    );
  }
}

class Comment {
  final String id;
  final User author;
  final String content;
  final DateTime createdAt;
  final List<Comment> replies;

  Comment({
    required this.id,
    required this.author,
    required this.content,
    required this.createdAt,
    this.replies = const [],
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id']?.toString() ?? '',
      author: User.fromJson(json['user'] ?? json['author'] ?? {}),
      content: json['content'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      replies: (json['replies'] as List?)?.map((r) => Comment.fromJson(r)).toList() ?? [],
    );
  }
}
