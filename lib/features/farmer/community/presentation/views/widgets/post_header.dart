import 'package:crop_guard/features/ecommerce/home/presentation/widgets/user_image.dart';
import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  final String subreddit;

  const PostHeader({
    super.key,
    required this.subreddit,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = subreddit == 'Loading...';

    return Row(
      children: [
        if (!isLoading)
          const UserImage(radius: 12)
        else
          const CircleAvatar(radius: 12, backgroundColor: Colors.grey),
        const SizedBox(width: 8),
        Text(
          isLoading ? 'Loading...' : subreddit,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
