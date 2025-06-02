import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Will be replaced with request trigger
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: const Text(
          'Post',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
