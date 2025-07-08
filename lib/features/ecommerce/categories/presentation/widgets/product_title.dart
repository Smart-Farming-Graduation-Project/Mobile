import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/cubits/review_rating_cubit/review_rating_cubit.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/cubits/review_rating_cubit/review_rating_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductTitle extends StatelessWidget {
  final String name;
  final String category;

  const ProductTitle({super.key, required this.name, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppTextStyles.font24BlackRegular.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 26.sp,
            height: 1.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: AppColors.kPrimaryColor.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: BlocBuilder<ReviewRatingCubit, ReviewRatingState>(
            builder: (context, state) {
              if (category == "categoryName") {
                if (state is ReviewRatingLoaded) {
                  return Text(
                    state.categoryName,
                    style: AppTextStyles.font14GreenSemiBold.copyWith(
                      fontSize: 12.sp,
                    ),
                  );
                } else if (state is ReviewRatingLoading) {
                  return Skeletonizer(
                    child: Text(
                      "category Name",
                      style: AppTextStyles.font14GreenSemiBold.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  );
                }
              }
              return Text(
                category,
                style: AppTextStyles.font14GreenSemiBold.copyWith(
                  fontSize: 12.sp,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
