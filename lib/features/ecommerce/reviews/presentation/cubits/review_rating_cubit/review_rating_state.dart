abstract class ReviewRatingState {}

class ReviewRatingInitial extends ReviewRatingState {}

class ReviewRatingLoading extends ReviewRatingState {}

class ReviewRatingLoaded extends ReviewRatingState {
  final double reviewRating;
  final String categoryName;

  ReviewRatingLoaded({required this.reviewRating, required this.categoryName});
}

class ReviewRatingError extends ReviewRatingState {
  final String error;

  ReviewRatingError({required this.error});
}
