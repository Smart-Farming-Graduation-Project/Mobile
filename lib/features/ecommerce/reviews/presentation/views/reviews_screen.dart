import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/cubits/review_cubit.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/cubits/review_state.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/widgets/review_card_widget.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/widgets/review_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReviewsScreen extends StatelessWidget {
  final int productId;

  const ReviewsScreen({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {

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
        create: (context) => getIt<ReviewCubit>()..loadReviews(productId),
        child: Column(
          children: [
            ReviewInputWidget(      
              productId: productId,
            ),
                
            const SizedBox(height: 10),
            BlocBuilder<ReviewCubit, ReviewState>(
              builder: (context, state) {
                if (state is ReviewsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ReviewsLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.reviews.length,
                      itemBuilder: (context, index) {
                        return ReviewCard(review: state.reviews[index]);
                      },
                    ),
                  );
                } else if (state is ReviewError) {
                  debugPrint(state.message);
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text("No reviews available"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
