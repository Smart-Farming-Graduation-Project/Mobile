import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  final String userName;
  final String userImageUrl;
  final VoidCallback? onTap;

  const PostHeader({
    super.key,
    required this.userName,
    required this.userImageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = userName == 'Loading...';

    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey[300],
            backgroundImage: isLoading ? null : NetworkImage(userImageUrl),
          ),
          const SizedBox(width: 8),
          Text(
            isLoading ? 'Loading...' : userName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
