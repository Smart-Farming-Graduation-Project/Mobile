import 'package:flutter/material.dart';
import 'toolbar.dart';

class PostBodyInput extends StatelessWidget {
  const PostBodyInput({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PostToolbar(),
          Divider(color: Colors.grey[300]),
          const TextField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Write something...",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
