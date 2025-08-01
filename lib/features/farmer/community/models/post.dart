enum VoteType { none, upvote, downvote }

class Post {
  final String id;
  final String userId;
  final String content;
  final DateTime timestamp;
  final int votes;
  final int comments;

  const Post({
    required this.id,
    required this.userId,
    required this.content,
    required this.timestamp,
    this.votes = 0,
    this.comments = 0,
  });

  int get score => votes;
}
