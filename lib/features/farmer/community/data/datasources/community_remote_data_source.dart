import '../models/post_model.dart';

abstract class CommunityRemoteDataSource {
  Stream<List<PostModel>> getPosts();
  Future<PostModel> createPost(String content, List<String> images);
  Future<void> votePost(String postId, int voteChange);
  Future<void> deletePost(String postId);
}

class CommunityRemoteDataSourceImpl implements CommunityRemoteDataSource {
  @override
  Stream<List<PostModel>> getPosts() async* {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    yield [];
  }

  @override
  Future<PostModel> createPost(String content, List<String> images) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    return PostModel(
      id: DateTime.now().millisecondsSinceEpoch,
      userId: 'current_user_id',
      content: content,
      createdAt: DateTime.now(),
      title: '',
      voteCount: 0,
    );
  }

  @override
  Future<void> votePost(String postId, int voteChange) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> deletePost(String postId) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
