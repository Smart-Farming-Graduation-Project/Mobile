import 'package:crop_guard/features/farmer/my_products/domain/entities/my_product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/core/helper/spacing.dart';

class MyProductCard extends StatelessWidget {
  final MyProductEntity product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const MyProductCard({
    super.key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            if (product.productImages.isNotEmpty)
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: NetworkImage(product.productImages.first),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.grey[300],
                ),
                child: Icon(
                  Icons.image_not_supported,
                  size: 64.w,
                  color: Colors.grey,
                ),
              ),
            verticalSpace(12),

            // Product Name
            Text(
              product.productName,
              style: AppTextStyles.font18BlackBold,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(8),

            // Category
            if (product.categoryName != null) ...[
              Text(
                'Category: ${product.categoryName}',
                style: AppTextStyles.font14GreyRegular,
              ),
              verticalSpace(8),
            ],

            // Price
            Row(
              children: [
                Text(
                  '\$${product.productPrice.toStringAsFixed(2)}',
                  style: AppTextStyles.font20BlackBold.copyWith(
                    color: AppColors.kGreenColor,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: product.productAvailability == 'available'
                        ? AppColors.kGreenColor
                        : Colors.orange,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    product.productAvailability,
                    style: AppTextStyles.font12WhiteRegular,
                  ),
                ),
              ],
            ),
            verticalSpace(8),

            // Rating
            if (product.productRating != null) ...[
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 16.w,
                    color: Colors.amber,
                  ),
                  horizontalSpace(4),
                  Text(
                    product.productRating!.toStringAsFixed(1),
                    style: AppTextStyles.font14BlackRegular,
                  ),
                ],
              ),
              verticalSpace(12),
            ],

            // Description
            Text(
              product.productDescription,
              style: AppTextStyles.font14BlackRegular,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(16),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onEdit,
                    icon: Icon(Icons.edit, size: 18.w),
                    label: const Text('Edit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kGreenColor,
                      foregroundColor: AppColors.kWhiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onDelete,
                    icon: Icon(Icons.delete, size: 18.w),
                    label: const Text('Delete'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kDangerColor,
                      foregroundColor: AppColors.kWhiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
