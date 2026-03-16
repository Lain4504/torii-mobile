/// Blog item from GET /api/blogs (academy.blog.findAll)
class BlogModel {
  final String id;
  final String title;
  final String slug;
  final String? excerpt;
  final String content;
  final String? coverImageUrl;
  final String authorId;
  final String status;
  final DateTime? publishedAt;
  final int viewCount;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;
  final BlogAuthor? author;

  const BlogModel({
    required this.id,
    required this.title,
    required this.slug,
    this.excerpt,
    required this.content,
    this.coverImageUrl,
    required this.authorId,
    required this.status,
    this.publishedAt,
    this.viewCount = 0,
    this.tags = const [],
    required this.createdAt,
    required this.updatedAt,
    this.author,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      excerpt: json['excerpt'] as String?,
      content: json['content'] as String? ?? '',
      coverImageUrl: json['coverImageUrl'] as String?,
      authorId: json['authorId'] as String,
      status: json['status'] as String? ?? 'draft',
      publishedAt: json['publishedAt'] != null
          ? DateTime.tryParse(json['publishedAt'].toString())
          : null,
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      createdAt: DateTime.parse(json['createdAt'].toString()),
      updatedAt: DateTime.parse(json['updatedAt'].toString()),
      author: json['author'] != null
          ? BlogAuthor.fromJson(json['author'] as Map<String, dynamic>)
          : null,
    );
  }

  String get formattedDate {
    final d = publishedAt ?? createdAt;
    return '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
  }
}

class BlogAuthor {
  final String id;
  final String displayName;
  final String email;
  final String? avatarUrl;

  const BlogAuthor({
    required this.id,
    required this.displayName,
    required this.email,
    this.avatarUrl,
  });

  factory BlogAuthor.fromJson(Map<String, dynamic> json) {
    return BlogAuthor(
      id: json['id'] as String,
      displayName: json['displayName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String?,
    );
  }
}
