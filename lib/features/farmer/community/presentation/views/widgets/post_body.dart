import 'package:flutter/material.dart';

class PostBody extends StatelessWidget {
  final String title;
  final String body;
  final int maxLines;

  const PostBody({
    super.key,
    required this.title,
    required this.body,
    this.maxLines = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          body,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
