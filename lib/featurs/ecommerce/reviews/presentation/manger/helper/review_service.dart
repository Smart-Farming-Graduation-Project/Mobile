import 'package:crop_guard/featurs/ecommerce/reviews/presentation/model/review_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: "https://crop-pilot-api.azurewebsites.net/api/Reviews"));

  Future<List<ReviewModel>> fetchReviews(int productId) async {
    try {
      final response = await _dio.get('/GetReviews/$productId');


      if (response.statusCode == 200 && response.data["data"] != null) {
        final List<dynamic> data = response.data["data"];
        return data.map((json) => ReviewModel.fromJson(json)).toList();
      } else {
        throw Exception("No data available");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addReview(ReviewModel review) async {
    try {
      await _dio.post('/CreateReview', data: review.toJson());
    } catch (e) {
      throw Exception("Failed to add review");
    }
  }

  Future<void> updateReview(ReviewModel review) async {
    try {
      await _dio.put('/UpdateReview/${review.reviewID}', data: review.toJson());
    } catch (e) {
      throw Exception("Failed to update review");
    }
  }

  Future<void> deleteReview(int reviewID) async {
    try {
      await _dio.delete('/DeleteReview/$reviewID');
    } catch (e) {
      throw Exception("Failed to delete review");
    }
  }
}
