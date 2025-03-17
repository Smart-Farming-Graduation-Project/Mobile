import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/reviews/presentation/manger/helper/review_service.dart';
import 'package:crop_guard/featurs/reviews/presentation/manger/review_cubit.dart';
import 'package:crop_guard/featurs/reviews/presentation/manger/review_state.dart';
import 'package:crop_guard/featurs/reviews/presentation/model/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'widgets/review_card_widget.dart';
import 'widgets/review_input_widget.dart';

class ReviewsScreen extends StatelessWidget {
  final int productId;

  const ReviewsScreen({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController reviewController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
        title: const Text(
          'Product Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => ReviewCubit(ApiService())..loadReviews(productId),
        child: BlocBuilder<ReviewCubit, ReviewState>(
          builder: (context, state) {
            if (state is ReviewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ReviewsLoaded) {
              return Column(
                children: [
                  ReviewInputWidget(
                    controller: reviewController,
                    onSubmit: () {
                      final reviewText = reviewController.text.trim();
                      if (reviewText.isNotEmpty) {
                        context.read<ReviewCubit>().submitReview(
                              ReviewModel(
                                reviewID: 0,
                                userID: '6',
                                firstName: "User",
                                lastName: "Test",
                                headline: 'Review',
                                rating: 5,
                                reviewText: reviewText,
                                reviewDate: DateTime.now(),
                                productId: productId,
                              ),
                            );
                        reviewController.clear();
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.reviews.length,
                      itemBuilder: (context, index) {
                        return ReviewCard(review: state.reviews[index]);
                      },
                    ),
                  ),
                ],
              );
            } else if (state is ReviewError) {
              debugPrint(state.message);
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("No reviews available"));
          },
        ),
      ),
    );
  }
}
