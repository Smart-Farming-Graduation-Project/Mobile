import 'package:flutter/material.dart';
import 'review_card_widget.dart';

class ReviewListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> reviews;

  const ReviewListWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return reviews.isEmpty
        ? const Center(child: Text("No reviews yet", style: TextStyle(color: Colors.grey)))
        : ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) => ReviewCardWidget(review: reviews[index]),
    );
  }
}
