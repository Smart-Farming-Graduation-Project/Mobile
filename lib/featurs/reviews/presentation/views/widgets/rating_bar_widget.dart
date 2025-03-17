import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  final double initialRating;
  final Function(double) onRatingUpdate;
  final double starSize;

  const RatingBarWidget({
    super.key,
    required this.initialRating,
    required this.onRatingUpdate,
    this.starSize = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: starSize,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
