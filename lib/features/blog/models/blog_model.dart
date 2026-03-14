/// Blog – matches gateway GET /api/blogs response (BlogResponseDTO).
/// Backend: id, title, slug, excerpt, content, coverImageUrl, authorId, status, publishedAt, viewCount, tags, createdAt, updatedAt, author?: { id, displayName, email, avatarUrl }.
class Blog {
  final String id;
  final String title;
  final String slug;
  final String? excerpt;
  final String content;
  final String? coverImageUrl;
  final String? authorId;
  final String status;
  final DateTime? publishedAt;
  final int viewCount;
  final List<String> tags;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final BlogAuthor? author;

  const Blog({
    required this.id,
    required this.title,
    required this.slug,
    this.excerpt,
    required this.content,
    this.coverImageUrl,
    this.authorId,
    this.status = 'draft',
    this.publishedAt,
    this.viewCount = 0,
    this.tags = const [],
    this.createdAt,
    this.updatedAt,
    this.author,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    final author = json['author'];
    return Blog(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      slug: json['slug']?.toString() ?? json['id']?.toString() ?? '',
      excerpt: json['excerpt']?.toString(),
      content: json['content']?.toString() ?? '',
      coverImageUrl: json['coverImageUrl']?.toString(),
      authorId: json['authorId']?.toString(),
      status: json['status']?.toString() ?? 'draft',
      publishedAt: json['publishedAt'] != null ? DateTime.tryParse(json['publishedAt'].toString()) : null,
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'].toString()) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt'].toString()) : null,
      author: author is Map<String, dynamic> ? BlogAuthor.fromJson(author) : null,
    );
  }

  String? get authorName => author?.displayName;
  String? get thumbnailUrl => coverImageUrl;
  String? get category => tags.isNotEmpty ? tags.first : null;
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
      id: json['id']?.toString() ?? '',
      displayName: json['displayName']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      avatarUrl: json['avatarUrl']?.toString(),
    );
  }
}
