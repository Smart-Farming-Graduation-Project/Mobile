import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/add_to_cart_button.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/favorite_icon.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/info_box.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/product_detail_expansion.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/product_image_details.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/product_title.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/review_stars.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/cubits/review_rating_cubit/review_rating_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundGray,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
        title: Text(
          'Product Details',
          style: AppTextStyles.font20WhiteBold.copyWith(
            fontSize: 22.sp,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.kWhiteColor,
            size: 24.sp,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => ReviewRatingCubit()
          ..getReminderProductDetails(product.productId),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.kBackgroundGray,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image Section
                        Container(
                          margin: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              const BoxShadow(
                                color: AppColors.kShadowColor,
                                blurRadius: 15,
                                spreadRadius: 0,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: ProductImageDetails(
                              image: product.productImages.isNotEmpty
                                  ? product.productImages[0]
                                  : "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
                            ),
                          ),
                        ),

                        // Product Info Section
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: AppColors.kCardWhite,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              const BoxShadow(
                                color: AppColors.kShadowColor,
                                blurRadius: 10,
                                spreadRadius: 0,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product Title and Favorite
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ProductTitle(
                                      name: product.productName,
                                      category: product.categoryName!,
                                    ),
                                  ),
                                  horizontalSpace(12),
                                  BlocProvider(
                                    create: (context) => FavoriteCubit(),
                                    child: FavoriteIcon(product: product),
                                  ),
                                ],
                              ),

                              verticalSpace(20),

                              // Info Box
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.kSensorCardGradientStart,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: AppColors.kSensorCardBorderGreen,
                                    width: 1,
                                  ),
                                ),
                                child: const InfoBoxDetails(),
                              ),

                              verticalSpace(20),

                              // Product Description
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.kBackgroundGray,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: ProductDetailExpansion(
                                  description: product.productDescription,
                                ),
                              ),

                              verticalSpace(20),

                              // Reviews Section
                              GestureDetector(
                                onTap: () {
                                  GoRouter.of(context).push(
                                    AppRouter.review,
                                    extra: product.productId,
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.kSensorCardGradientStart,
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                      color: AppColors.kSensorCardBorderGreen
                                          .withValues(alpha: 0.3),
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Customer Reviews',
                                        style: AppTextStyles.font16BlackSemiBold,
                                      ),
                                      verticalSpace(12),
                                      ReviewStars(
                                        productId: product.productId,
                                        rating: product.productRating ?? 0.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              verticalSpace(20),

                              BlocProvider(
                                create: (context) => AddToCartCubit()
                                  ..checkIfProductIsAddedToCart(
                                      product.productId),
                                child: AddToCartButton(product: product),
                              ),
                            ],
                          ),
                        ),

                        // Bottom spacing
                        verticalSpace(20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
