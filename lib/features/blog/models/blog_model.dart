class Blog {
  final String id;
  final String slug;
  final String title;
  final String? excerpt;
  final String? thumbnailUrl;
  final String? category;
  final String? authorName;
  final DateTime? publishedAt;

  Blog({
    required this.id,
    required this.slug,
    required this.title,
    this.excerpt,
    this.thumbnailUrl,
    this.category,
    this.authorName,
    this.publishedAt,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    final id = (json['id'] ?? json['_id'] ?? '').toString();
    final slug = (json['slug'] ?? json['seoSlug'] ?? id).toString();
    final title = (json['title'] ?? json['name'] ?? 'Untitled').toString();

    String? thumb;
    if (json['thumbnailUrl'] != null) {
      thumb = json['thumbnailUrl'].toString();
    } else if (json['coverImage'] != null) {
      thumb = json['coverImage'].toString();
    } else if (json['imageUrl'] != null) {
      thumb = json['imageUrl'].toString();
    }

    String? author;
    if (json['authorName'] != null) {
      author = json['authorName'].toString();
    } else if (json['author'] is Map<String, dynamic>) {
      final a = json['author'] as Map<String, dynamic>;
      author = (a['displayName'] ?? a['name'])?.toString();
    }

    String? category;
    if (json['category'] != null) {
      category = json['category'].toString();
    } else if (json['tags'] is List && (json['tags'] as List).isNotEmpty) {
      category = (json['tags'] as List).first.toString();
    }

    DateTime? publishedAt;
    final publishedAtRaw = json['publishedAt'] ?? json['createdAt'];
    if (publishedAtRaw != null) {
      try {
        publishedAt = DateTime.parse(publishedAtRaw.toString());
      } catch (_) {
        publishedAt = null;
      }
    }

    return Blog(
      id: id,
      slug: slug,
      title: title,
      excerpt: json['excerpt']?.toString() ?? json['summary']?.toString(),
      thumbnailUrl: thumb,
      category: category,
      authorName: author,
      publishedAt: publishedAt,
    );
  }
}

