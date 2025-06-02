import 'package:crop_guard/features/ecommerce/reviews/data/models/review_model.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(review.headline,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins')),
              const SizedBox(height: 4),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < review.rating ? Icons.star : Icons.star_border,
                    color: Colors.yellow[700],
                  );
                }),
              ),
              const SizedBox(height: 8),
              Text(review.reviewText,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text("By ${review.firstName} ${review.lastName}",
                  style: TextStyle(
                      color: Colors.black.withAlpha(150), fontSize: 13)),
              const SizedBox(height: 4),
              Text(
                  "Date: ${review.reviewDate.toLocal().year}-${review.reviewDate.toLocal().month}-${review.reviewDate.toLocal().day} ${review.reviewDate.toLocal().hour}:${review.reviewDate.toLocal().minute}",
                  style: TextStyle(
                      color: Colors.black.withAlpha(150), fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }
}
