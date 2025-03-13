import 'package:flutter/material.dart';

class ReviewCardWidget extends StatelessWidget {
  final Map<String, dynamic> review;

  const ReviewCardWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Row(
          children: [
            Text(review["rating"].toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
            const Icon(Icons.star, color: Colors.amber, size: 18),
          ],
        ),
        subtitle: Text(review["comment"]),
        trailing: Text(review["date"], style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ),
    );
  }
}
