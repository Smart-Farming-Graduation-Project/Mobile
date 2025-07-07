import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/product_item_skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListSkeleton extends StatelessWidget {
  const ProductListSkeleton({
    super.key,
    this.itemCount = 5,
    this.padding = const EdgeInsets.symmetric(horizontal: 12.0),
    this.itemWidth = 153,
    this.isHorizontal = true,
  });

  final int itemCount;
  final EdgeInsetsGeometry padding;
  final double itemWidth;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    if (isHorizontal) {
      return SizedBox(
        height: 200.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: padding,
          itemCount: itemCount,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: SizedBox(
              width: itemWidth.w,
              child: _buildCompactSkeletonItem(),
            ),
          ),
        ),
      );
    }
    
    return ProductItemSkeletonizer(
      itemCount: itemCount,
      isGrid: false,
      padding: padding,
    );
  }

  Widget _buildCompactSkeletonItem() {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Favorite icon skeleton
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 16.w,
              height: 16.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 4.h),

          // Product image skeleton
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          SizedBox(height: 6.h),

          // Product name skeleton
          Container(
            width: double.infinity,
            height: 10.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(height: 4.h),

          // Product price skeleton
          Container(
            width: 50.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(height: 4.h),

          // Rating skeleton
          Row(
            children: [
              Container(
                width: 40.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                width: 25.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: Colors.grey,
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
