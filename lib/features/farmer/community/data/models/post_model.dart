class PostModel {
  final int id;
  final String userId;
  final String title;
  final String content;
  final int voteCount;
  final DateTime createdAt;

  PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.voteCount,
    required this.createdAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      content: json['content'],
      voteCount: json['voteCount'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
