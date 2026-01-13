import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_providers.dart';
import '../models/post_model.dart';
import '../repositories/post_repository.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return PostRepository(apiClient.client);
});

final postListProvider = FutureProvider<List<Post>>((ref) async {
  final repository = ref.watch(postRepositoryProvider);
  return repository.getPosts();
});

final postCommentsProvider = FutureProvider.family<List<Comment>, String>((ref, postId) async {
  final repository = ref.watch(postRepositoryProvider);
  return repository.getComments(postId);
});
