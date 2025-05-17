import '../../domain/entities/post.dart';
import '../../domain/repositories/community_repository.dart';
import '../datasources/community_remote_data_source.dart';

class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityRemoteDataSource remoteDataSource;

  CommunityRepositoryImpl(this.remoteDataSource);

  @override
  Stream<List<Post>> getPosts() {
    return remoteDataSource.getPosts().map((models) => models
        .map((model) => Post(
              id: model.id.toString(),
              userId: model.userId,
              content: model.content,
              timestamp: model.createdAt,
              votes: model.voteCount,
            ))
        .toList());
  }

  @override
  Future<Post> createPost(String content, List<String> images) async {
    final model = await remoteDataSource.createPost(content, images);
    return Post(
      id: model.id.toString(),
      userId: model.userId,
      content: model.content,
      timestamp: model.createdAt,
      votes: model.voteCount,
    );
  }

  @override
  Future<void> votePost(String postId, int voteChange) async {
    await remoteDataSource.votePost(postId, voteChange);
  }

  @override
  Future<void> deletePost(String postId) async {
    await remoteDataSource.deletePost(postId);
  }
}
