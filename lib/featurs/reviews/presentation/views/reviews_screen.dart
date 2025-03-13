import 'package:flutter/material.dart';
import 'widgets/rating_bar_widget.dart';
import 'widgets/review_input_widget.dart';
import 'widgets/review_list_widget.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  double rating = 0;
  final TextEditingController commentController = TextEditingController();
  List<Map<String, dynamic>> reviews = [];

  void submitReview() {
    if (commentController.text.isNotEmpty) {
      setState(() {
        reviews.insert(0, {
          "rating": rating,
          "comment": commentController.text,
          "date": DateTime.now().toLocal().toString().substring(0, 16),
        });
        commentController.clear();
        rating = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Rate this product", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 25),
            RatingBarWidget(initialRating: rating, onRatingUpdate: (newRating) => setState(() => rating = newRating)),
            const SizedBox(height: 25),
            ReviewInputWidget(controller: commentController, onSubmit: submitReview),
            const SizedBox(height: 25),
            const Text("Customer Reviews", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 25),
            Expanded(child: ReviewListWidget(reviews: reviews)),
          ],
        ),
      ),
    );
  }
}
