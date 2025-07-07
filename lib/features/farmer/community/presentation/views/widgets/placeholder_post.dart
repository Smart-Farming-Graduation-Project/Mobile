import 'package:crop_guard/features/farmer/community/models/post_model.dart';

class PlaceholderPost extends PostModel {
  PlaceholderPost()
      : super(
    id: 0,
    userId: 'Loading...',
    userName: 'Loading...',
    userImageUrl: '',
    title: 'Loading...',
    content: 'Loading...',
    voteCount: 0,
    createdAt: DateTime.now(),
    userVoteStatus: 0,
    updatedAt: null,
  );
}
