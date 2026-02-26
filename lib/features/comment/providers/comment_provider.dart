import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_providers.dart';
import '../../../services/comment/comment_service.dart';
import '../models/comment_model.dart';

/// Comment Service Provider
final commentServiceProvider = Provider<CommentService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return CommentService(apiClient);
});

/// Comment State
class CommentState {
  final List<Comment> comments;
  final bool isLoading;
  final bool isLoadingMore;
  final bool isSubmitting;
  final String? error;
  final int currentPage;
  final bool hasMore;

  CommentState({
    this.comments = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.isSubmitting = false,
    this.error,
    this.currentPage = 1,
    this.hasMore = true,
  });

  CommentState copyWith({
    List<Comment>? comments,
    bool? isLoading,
    bool? isLoadingMore,
    bool? isSubmitting,
    String? error,
    int? currentPage,
    bool? hasMore,
  }) {
    return CommentState(
      comments: comments ?? this.comments,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

/// Comment Notifier
class CommentNotifier extends AutoDisposeFamilyNotifier<CommentState, String> {
  CommentService get _commentService => ref.read(commentServiceProvider);
  String get postId => arg;

  @override
  CommentState build(String arg) {
    return CommentState();
  }

  /// Load comments
  Future<void> loadComments({bool refresh = false}) async {
    if (refresh) {
      state = CommentState(isLoading: true, comments: []);
    } else if (state.isLoading || state.isLoadingMore) {
      return;
    }

    try {
      final response = await _commentService.getComments(
        postId: postId,
        page: 1,
        limit: 20,
      );

      if (!response.success) {
        state = state.copyWith(
          isLoading: false,
          error: response.message ?? 'Failed to load comments',
        );
        return;
      }

      final paginatedComments = response.data!;

      state = state.copyWith(
        comments: paginatedComments.comments,
        isLoading: false,
        currentPage: 1,
        hasMore: paginatedComments.hasMore,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Load more comments
  Future<void> loadMoreComments() async {
    if (!state.hasMore || state.isLoadingMore || state.isLoading) {
      return;
    }

    state = state.copyWith(isLoadingMore: true);

    try {
      final nextPage = state.currentPage + 1;
      final response = await _commentService.getComments(
        postId: postId,
        page: nextPage,
        limit: 20,
      );

      if (!response.success) {
        state = state.copyWith(
          isLoadingMore: false,
          error: response.message ?? 'Failed to load more comments',
        );
        return;
      }

      final paginatedComments = response.data!;

      state = state.copyWith(
        comments: [...state.comments, ...paginatedComments.comments],
        isLoadingMore: false,
        currentPage: nextPage,
        hasMore: paginatedComments.hasMore,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false, error: e.toString());
    }
  }

  /// Submit a new comment
  Future<bool> submitComment({
    required String content,
    String? parentId,
  }) async {
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      final response = await _commentService.createComment(
        postId: postId,
        content: content,
        parentId: parentId,
      );

      if (!response.success) {
        state = state.copyWith(
          isSubmitting: false,
          error: response.message ?? 'Failed to submit comment',
        );
        return false;
      }

      // Refresh comments after successful submission
      await loadComments(refresh: true);

      state = state.copyWith(isSubmitting: false, error: null);
      return true;
    } catch (e) {
      state = state.copyWith(isSubmitting: false, error: e.toString());
      return false;
    }
  }

  /// Delete a comment
  Future<bool> deleteComment(String commentId) async {
    try {
      final response = await _commentService.deleteComment(commentId);

      if (!response.success) {
        state = state.copyWith(
          error: response.message ?? 'Failed to delete comment',
        );
        return false;
      }

      // Optimistically remove comment from list or refresh
      state = state.copyWith(
        comments: state.comments.where((c) => c.id != commentId).toList(),
      );
      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    }
  }
}

/// Comment Provider Family
/// Usage: ref.watch(commentProvider(postId))
final commentProvider = AutoDisposeNotifierProvider.family<CommentNotifier, CommentState, String>(CommentNotifier.new);
