class PostModel {
  final int id;
  final String userId;
  final String userName;
  final String userImageUrl;
  final String title;
  final String content;
  final int voteCount;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int userVoteStatus;

  PostModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userImageUrl,
    required this.title,
    required this.content,
    required this.voteCount,
    required this.createdAt,
    this.updatedAt,
    required this.userVoteStatus,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      userName: json['userName'],
      userImageUrl: json['userImageUrl'],
      title: json['title'],
      content: json['content'],
      voteCount: json['voteCount'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
      userVoteStatus: json['userVoteStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userImageUrl': userImageUrl,
      'title': title,
      'content': content,
      'voteCount': voteCount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'userVoteStatus': userVoteStatus,
    };
  }
}
