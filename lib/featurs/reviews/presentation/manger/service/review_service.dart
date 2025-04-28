import 'package:dio/dio.dart';
import 'package:crop_guard/featurs/reviews/presentation/model/review_model.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);


  /// Get all reviews for a specific product
  Future<List<ReviewModel>> fetchReviews(int productId) async {
    try {
      final response = await dio.get('/api/Reviews/GetReviews/$productId');

      if (response.statusCode == 200 && response.data != null && response.data['data'] != null) {
        final data = response.data['data'] as List;
        return data.map((json) {
          json['productId'] = productId; // Manually assign productId
          return ReviewModel.fromJson(json);
        }).toList();
      } else {
        throw Exception("No reviews found for product $productId.");
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return []; // Return an empty list if no reviews are found
      } else {
        throw Exception("Error fetching reviews: ${e.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error: ${e.toString()}");
    }
  }

  /// Create a new review
  Future<void> addReview(ReviewModel review) async {
    final body = {
      "productID": review.productId,
      "headline": review.headline,
      "rating": review.rating,
      "reviewText": review.reviewText,
    };
    try {
      final response = await dio.post('/api/Reviews/CreateReview', data: body);
      if (response.statusCode != 201) {
        throw Exception("Failed to create review. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error adding review: ${e.toString()}");
    }
  }

  /// Update an existing review
  Future<void> updateReview(ReviewModel review) async {
    final body = {
      "reviewID": review.reviewID,
      "headline": review.headline,
      "rating": review.rating,
      "reviewText": review.reviewText,
    };
    try {
      final response = await dio.put('/api/Reviews/UpdateReview/${review.reviewID}', data: body);
      if (response.statusCode != 200) {
        throw Exception("Failed to update review. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error updating review: ${e.toString()}");
    }
  }

  /// Delete a review by ID
  Future<void> deleteReview(int reviewID) async {
    try {
      final response = await dio.delete('/api/Reviews/DeleteReview/$reviewID');
      if (response.statusCode != 200) {
        throw Exception("Failed to delete review. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error deleting review: ${e.toString()}");
    }
  }}
