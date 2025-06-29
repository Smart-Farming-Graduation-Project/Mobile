import 'dart:developer';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/reviews/data/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());

  final api = getIt<DioConsumer>();
  double rating = 0;
  TextEditingController reviewController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  Future<void> loadReviews(int productId) async {
    emit(ReviewsLoading());
    try {
      final reviews = await api.get(EndPoints.getReviews(productId.toString()));
      final reviewsList = <ReviewModel>[];
      for (var review in reviews[ApiKeys.data]) {
        final reviewModel = ReviewModel.fromJson(review);
        reviewsList.add(reviewModel);
      }
      emit(ReviewsLoaded(reviewsList));
    } on ServerException catch (e) {
      emit(ReviewError(e.errorModel.errorMessage));
    }
  }

  Future<void> submitReview({required int productId}) async {
    try {
      emit(ReviewSubmitted());
      log("rating: $rating");
      log("titleController: ${titleController.text}");
      log("reviewController: ${reviewController.text}");
      log("productId: $productId");
      await api.post(EndPoints.addReview, data: {
        "productId": productId,
        "headline": titleController.text,
        "rating": rating.toInt(),
        "reviewText": reviewController.text,
      });
      await loadReviews(productId);
    } catch (e) {
      emit(ReviewError("Failed to submit review: ${e.toString()}"));
    }
  }

  Future<void> updateReview(ReviewModel review) async {
    // try {
    //   await apiService.updateReview(review);
    //   final reviews = await apiService.fetchReviews(review.productId);
    //   emit(ReviewsLoaded(reviews));
    // } catch (e) {
    //   emit(ReviewError("Failed to update review: ${e.toString()}"));
    // }
  }

  Future<void> deleteReview(int reviewID, int productId) async {
    // try {
    //   await apiService.deleteReview(reviewID);
    //   final reviews = await apiService.fetchReviews(productId);
    //   emit(ReviewsLoaded(reviews));
    // } catch (e) {
    //   emit(ReviewError("Failed to delete review: ${e.toString()}"));
    // }
  }
}
