import 'package:flutter/material.dart';

class PostBody extends StatelessWidget {
  final String title;
  final String body;
  final int maxLines;

  const PostBody({
    super.key,
    required this.title,
    required this.body,
    this.maxLines = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          body,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[800],
          ),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
