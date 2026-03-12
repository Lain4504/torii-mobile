import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/blog/models/blog_model.dart';
import 'package:torii_app/features/blog/repositories/blog_repository.dart';

final blogRepositoryProvider = Provider<BlogRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return BlogRepository(apiClient.client);
});

class BlogListState {
  final List<Blog> blogs;
  final bool isLoading;
  final String? error;
  final int page;
  final bool hasMore;

  const BlogListState({
    this.blogs = const [],
    this.isLoading = false,
    this.error,
    this.page = 1,
    this.hasMore = true,
  });

  BlogListState copyWith({
    List<Blog>? blogs,
    bool? isLoading,
    String? error,
    int? page,
    bool? hasMore,
  }) {
    return BlogListState(
      blogs: blogs ?? this.blogs,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

class BlogListNotifier extends Notifier<BlogListState> {
  @override
  BlogListState build() => const BlogListState();

  Future<void> loadBlogs({bool refresh = true}) async {
    if (state.isLoading) return;

    final repo = ref.read(blogRepositoryProvider);
    final page = refresh ? 1 : state.page;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final blogs = await repo.getBlogs(page: page, limit: 10);

      state = state.copyWith(
        blogs: refresh ? blogs : [...state.blogs, ...blogs],
        isLoading: false,
        page: page + 1,
        hasMore: blogs.length >= 10,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

final blogListProvider =
    NotifierProvider<BlogListNotifier, BlogListState>(BlogListNotifier.new);

