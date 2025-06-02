import '../entities/post.dart';

abstract class CommunityRepository {
  Stream<List<Post>> getPosts();
  Future<Post> createPost(String content, List<String> images);
  Future<void> votePost(String postId, int voteChange);
  Future<void> deletePost(String postId);
}
