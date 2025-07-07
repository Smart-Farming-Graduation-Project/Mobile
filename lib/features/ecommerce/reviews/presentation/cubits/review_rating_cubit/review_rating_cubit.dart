import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'review_rating_state.dart';

class ReviewRatingCubit extends Cubit<ReviewRatingState> {
  ReviewRatingCubit() : super(ReviewRatingInitial());
  final api = getIt<DioConsumer>();

  Future<void> getReminderProductDetails(int productId) async {
    try {
      emit(ReviewRatingLoading());
      final response = await api.get(EndPoints.getProductDetails(productId.toString()));
      final double reviewRating = response[ApiKeys.data]["averageRating"].toDouble();
      final String categoryName = response[ApiKeys.data]["categoryName"];
      emit(ReviewRatingLoaded(reviewRating: reviewRating, categoryName: categoryName));
    }on ServerException catch (e) {
      emit(ReviewRatingError(error: e.errorModel.errorMessage));
    }
  }
}
