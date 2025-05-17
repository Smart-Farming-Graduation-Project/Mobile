import '../../domain/entities/post.dart';

enum CommunityStatus { initial, loading, loaded, error }

class CommunityState {
  final CommunityStatus status;
  final List<Post> posts;
  final String? errorMessage;

  const CommunityState({
    this.status = CommunityStatus.initial,
    this.posts = const [],
    this.errorMessage,
  });

  CommunityState copyWith({
    CommunityStatus? status,
    List<Post>? posts,
    String? errorMessage,
  }) {
    return CommunityState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
