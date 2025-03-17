import 'package:crop_guard/featurs/reviews/presentation/model/review_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'helper/review_service.dart';
import 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final ApiService apiService;

  ReviewCubit(this.apiService) : super(ReviewInitial());

  Future<void> loadReviews(int productId) async {
    emit(ReviewsLoading());
    try {
      final reviews = await apiService.fetchReviews(productId);
      emit(ReviewsLoaded(reviews));
    } catch (e) {
      print("Error loading reviews: ${e.toString()}");
      emit(ReviewError("Failed to load reviews: ${e.toString()}"));
    }
  }

  Future<void> submitReview(ReviewModel review) async {
    try {
      await apiService.addReview(review);
      final reviews = await apiService.fetchReviews(review.productId);
      emit(ReviewsLoaded(reviews));
    } catch (e) {
      print(" Error submitting review: ${e.toString()}");
      emit(ReviewError("Failed to submit review: ${e.toString()}"));
    }
  }

  Future<void> updateReview(ReviewModel review) async {
    try {
      await apiService.updateReview(review);
      final reviews = await apiService.fetchReviews(review.productId);
      emit(ReviewsLoaded(reviews));
    } catch (e) {
      print(" Error updating review: ${e.toString()}");
      emit(ReviewError("Failed to update review: ${e.toString()}"));
    }
  }

  Future<void> deleteReview(int reviewID, int productId) async {
    try {
      await apiService.deleteReview(reviewID);
      final reviews = await apiService.fetchReviews(productId);
      emit(ReviewsLoaded(reviews));
    } catch (e) {
      print(" Error deleting review: ${e.toString()}");
      emit(ReviewError("Failed to delete review: ${e.toString()}"));
    }
  }
}
