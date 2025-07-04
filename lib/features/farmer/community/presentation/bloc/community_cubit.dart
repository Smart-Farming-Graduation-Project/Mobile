import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/community_repository.dart';
import 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  final CommunityRepository repository;

  CommunityCubit(this.repository) : super(const CommunityState()) {
    // Load posts
    repository.getPosts().listen((posts) {
      emit(state.copyWith(
        status: CommunityStatus.loaded,
        posts: posts,
      ));
    });
  }

  Future<void> createPost(String content, List<String> images) async {
    try {
      emit(state.copyWith(status: CommunityStatus.loading));
      final post = await repository.createPost(content, images);
      emit(state.copyWith(
        status: CommunityStatus.loaded,
        posts: [...state.posts, post],
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CommunityStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> votePost(String postId, int voteChange) async {
    try {
      emit(state.copyWith(status: CommunityStatus.loading));
      await repository.votePost(postId, voteChange);

      // Update post in the list
      final updatedPosts = state.posts.map((post) {
        if (post.id == postId) {
          return Post(
            id: post.id,
            userId: post.userId,
            content: post.content,
            timestamp: post.timestamp,
            votes: post.votes + voteChange,
            comments: post.comments,
          );
        }
        return post;
      }).toList();

      emit(state.copyWith(
        status: CommunityStatus.loaded,
        posts: updatedPosts,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CommunityStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      emit(state.copyWith(status: CommunityStatus.loading));
      await repository.deletePost(postId);
      emit(state.copyWith(
        status: CommunityStatus.loaded,
        posts: state.posts.where((post) => post.id != postId).toList(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CommunityStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
