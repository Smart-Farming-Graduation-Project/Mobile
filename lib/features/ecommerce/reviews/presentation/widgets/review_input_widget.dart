import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/cubits/review_cubit.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/cubits/review_state.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rating_bar_widget.dart';
import 'review_decoration_title.dart';

class ReviewInputWidget extends StatelessWidget {
  final int productId;

  const ReviewInputWidget({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<ReviewCubit>();
    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const ReviewDecorationTitle(
                  titleReview: 'Write a Review', sizeText: 24, width: 200),
              const SizedBox(height: 5),
              RatingBarWidget(
                initialRating: 0,
                onRatingUpdate: (double rating) {
                  cubit.rating = rating;
                },
              ),
              const SizedBox(height: 10),
              // Title field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cubit.titleController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Review Title",
                    hintText: "Enter a title for your review",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.kPrimaryColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Review text field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cubit.reviewController,
                  maxLines: 2,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter your review...",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.kPrimaryColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    cubit.submitReview(
                      productId: productId,
                    );
                    cubit.titleController.clear();
                    cubit.reviewController.clear();
                    cubit.rating = 0;
                  },
                  child: state is ReviewSubmitted
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: CircularProgressIndicator(
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                        )
                      : const SubmitButton(
                          buttoncolor: AppColors.kPrimaryColor,
                          buttonwidth: 350,
                          buttonheight: 50,
                          buttontext: 'Submit',
                          textcolor: AppColors.kWhiteColor),
                ),
              ),
              const SizedBox(height: 10),
              const ReviewDecorationTitle(
                  titleReview: 'Reviews', sizeText: 20, width: 100)
            ],
          ),
        );
      },
    );
  }
}
