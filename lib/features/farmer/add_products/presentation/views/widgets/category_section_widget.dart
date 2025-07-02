import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/features/ecommerce/categories/data/models/category_model.dart';

class CategorySectionWidget extends StatelessWidget {
  final CategoryModel? selectedCategory;
  final VoidCallback onTap;

  const CategorySectionWidget({
    super.key,
    required this.selectedCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: AppTextStyles.font16BlackBold,
        ),
        verticalSpace(8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.kGrayColor),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                if (selectedCategory != null) ...[
                  Image.network(
                    selectedCategory!.image,
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                  horizontalSpace(12),
                  Expanded(
                    child: Text(
                      selectedCategory!.categoryName,
                      style: AppTextStyles.font14BlackRegular,
                    ),
                  ),
                ] else ...[
                  Icon(
                    Icons.category_outlined,
                    color: AppColors.kGrayColor,
                    size: 24.sp,
                  ),
                  horizontalSpace(12),
                  Text(
                    'Select Category',
                    style: AppTextStyles.font14TextGrayRegular,
                  ),
                ],
                const Spacer(),
                const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.kGrayColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
