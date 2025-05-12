import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/manger/category_cubit/product_cubit.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/manger/helper/sellers_list.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/views/widgets/add_to_cart_button.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/views/widgets/product_detail_expansion.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/views/widgets/product_title.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/views/widgets/review_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'widgets/info_box.dart';
import 'widgets/product_image_details.dart';
import 'widgets/seller_info.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Scaffold(
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
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductImageDetails(
                          image: product.productImages.isNotEmpty
                              ? product.productImages[0]
                              : "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            ProductTitle(
                                name: product.productName,
                                category: product.categoryName!),
                            const Spacer(),
                            // FavoriteIcon(product: widget.product),
                          ],
                        ),
                        const SizedBox(height: 18),
                        const InfoBoxDetails(),
                        const SizedBox(height: 18),
                        // Row(
                        //   children: [
                        //     QuantitySelector(
                        //       quantity: quantity,
                        //       onIncrement: incrementQuantity,
                        //       onDecrement: decrementQuantity,
                        //     ),
                        //     const Spacer(),
                        //     PriceDisplay(price: product.productPrice),
                        //   ],
                        // ),
                        const SizedBox(height: 10),
                        ProductDetailExpansion(
                            description: product.productDescription),
                        const SizedBox(height: 10),
                        ReviewStars(
                          productId: product.productId,
                          rating: product.productRating ?? 0.0,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SellerInfoTile(seller: sellersList[0]),
                            const Spacer(),
                            const AddToCartButton(),
                          ],
                        ),
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
