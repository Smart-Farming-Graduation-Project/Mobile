import 'package:crop_guard/featurs/ecommerce/reviews/presentation/model/review_model.dart';

abstract class ReviewState {}

class ReviewInitial extends ReviewState {}

class ReviewsLoading extends ReviewState {}

class ReviewsLoaded extends ReviewState {
  final List<ReviewModel> reviews;

  ReviewsLoaded(this.reviews);
}

class ReviewError extends ReviewState {
  final String message;

  ReviewError(this.message);
}
