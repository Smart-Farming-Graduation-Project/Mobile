class CommentModel {
  final int id;
  final int postId;
  final int? parentCommentId;
  final String content;
  final String userId;
  final String userName;
  final String userImageUrl;
  final DateTime createdAt;

  CommentModel({
    required this.id,
    required this.postId,
    required this.parentCommentId,
    required this.content,
    required this.userId,
    required this.userName,
    required this.userImageUrl,
    required this.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      postId: json['postId'],
      parentCommentId: json['parentCommentId'],
      content: json['content'],
      userId: json['userId'],
      userName: 'User',
      userImageUrl: '',
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
