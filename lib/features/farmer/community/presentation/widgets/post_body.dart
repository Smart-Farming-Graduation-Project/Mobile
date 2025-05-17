import 'package:flutter/material.dart';

class PostBody extends StatelessWidget {
  final String title;
  final String body;

  const PostBody({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Text(body,
            style: const TextStyle(
                color: Colors.white70, fontSize: 14, height: 1.4)),
      ],
    );
  }
}
