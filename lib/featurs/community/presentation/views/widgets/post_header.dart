import 'package:crop_guard/featurs/home/presentation/views/widgets/user_image.dart';
import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  final String subreddit;

  const PostHeader({
    super.key,
    required this.subreddit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const UserImage(radius: 12,),
        const SizedBox(width: 8),
        Text(
          '$subreddit ',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}
