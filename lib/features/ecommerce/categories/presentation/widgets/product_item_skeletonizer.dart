import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductItemSkeletonizer extends StatelessWidget {
  const ProductItemSkeletonizer({
    super.key,
    this.itemCount = 1,
    this.isGrid = false,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 20,
    this.mainAxisSpacing = 20,
    this.childAspectRatio = 0.7,
    this.padding = const EdgeInsets.all(12.0),
  });

  final int itemCount;
  final bool isGrid;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: isGrid
          ? GridView.builder(
              padding: padding,
              itemCount: itemCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: mainAxisSpacing,
                childAspectRatio: childAspectRatio,
              ),
              itemBuilder: (context, index) => _buildSkeletonProductItem(),
            )
          : ListView.builder(
              padding: padding,
              itemCount: itemCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildSkeletonProductItem(),
            ),
    );
  }

  Widget _buildSkeletonProductItem() {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.kCardWhite,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.kShadowColor,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Favorite icon skeleton
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 20.w,
              height: 20.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kGrayColor,
              ),
            ),
          ),
          SizedBox(height: 6.h),

          // Product image skeleton
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.kBackgroundGray,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          SizedBox(height: 8.h),

          // Product name skeleton
          Container(
            width: double.infinity,
            height: 12.h,
            decoration: BoxDecoration(
              color: AppColors.kGrayColor,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(height: 6.h),

          // Product price skeleton
          Container(
            width: 60.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: AppColors.kGrayColor,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(height: 6.h),

          // Rating skeleton
          Row(
            children: [
              Container(
                width: 50.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: AppColors.kGrayColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(width: 6.w),
              Container(
                width: 30.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: AppColors.kGrayColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
