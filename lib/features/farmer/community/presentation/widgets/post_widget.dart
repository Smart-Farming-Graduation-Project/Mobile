import 'package:flutter/material.dart';
import '../../domain/entities/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  final Function(int) onVote;
  final VoidCallback onDelete;

  const PostWidget({
    super.key,
    required this.post,
    required this.onVote,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User ${post.userId}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _formatDate(post.timestamp),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: onDelete,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(post.content),
            if (post.images.isNotEmpty) ...[
              const SizedBox(height: 8.0),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: post.images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.network(
                        post.images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 8.0),
            Row(
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_upward),
                      onPressed: () => onVote(1),
                    ),
                    Text(
                      '${post.votes}',
                      style: TextStyle(
                        color: post.votes > 0
                            ? Colors.orange
                            : post.votes < 0
                                ? Colors.blue
                                : Colors.grey,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_downward),
                      onPressed: () => onVote(-1),
                    ),
                  ],
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {
                  },
                ),
                Text('${post.comments}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
