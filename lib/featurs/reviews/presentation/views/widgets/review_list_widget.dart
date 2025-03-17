import 'package:crop_guard/featurs/reviews/presentation/model/review_model.dart';
import 'package:flutter/material.dart';

class ReviewListWidget extends StatelessWidget {
  final List<ReviewModel> reviews;
  final Function(int) onDelete;
  final Function(ReviewModel) onUpdate;

  const ReviewListWidget({
    super.key,
    required this.reviews,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const Center(
        child: Text(
          "No reviews yet. Be the first to write one!",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }

    return ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];

        return Dismissible(
          key: Key(review.reviewID.toString()),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.red,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) => onDelete(review.reviewID),
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title:
                  Text(review.reviewText, style: const TextStyle(fontSize: 16)),
              subtitle: Text.rich(
                TextSpan(
                  text: "⭐ ",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "${review.rating}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => onUpdate(review),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => onDelete(review.reviewID),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
