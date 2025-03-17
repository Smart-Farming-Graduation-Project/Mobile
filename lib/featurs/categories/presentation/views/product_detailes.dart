import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/categories/presentation/manger/cubit/product_cubit.dart';
import 'package:crop_guard/featurs/categories/presentation/models/product_model.dart';
import 'package:crop_guard/featurs/categories/presentation/views/widgets/add_to_cart_button.dart';
import 'package:crop_guard/featurs/categories/presentation/views/widgets/price_display.dart';
import 'package:crop_guard/featurs/categories/presentation/views/widgets/product_detail_expansion.dart';
import 'package:crop_guard/featurs/categories/presentation/views/widgets/product_title.dart';
import 'package:crop_guard/featurs/categories/presentation/views/widgets/quantity_selector.dart';
import 'package:crop_guard/featurs/categories/presentation/views/widgets/review_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'widgets/favorite_icon.dart';
import 'widgets/info_box.dart';
import 'widgets/product_image_details.dart';
import 'widgets/seller_info.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }
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
                        ProductImageDetails(image: widget.product.image),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            ProductTitle(
                                name: widget.product.name,
                                category: widget.product.category),
                            const Spacer(),
                            FavoriteIcon(product: widget.product),
                          ],
                        ),
                        const SizedBox(height: 18),
                        const InfoBoxDetails(),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            QuantitySelector(
                              quantity: quantity,
                              onIncrement: incrementQuantity,
                              onDecrement: decrementQuantity,
                            ),
                            const Spacer(),
                            PriceDisplay(
                                price: double.tryParse(widget.product.price) ??
                                    0.0),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ProductDetailExpansion(
                            description: widget.product.description),
                        const SizedBox(height: 10),
                        ReviewStars(
                          productId:widget. product.id,
                          rating: widget.product.rating,

                        ),

                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SellerInfoTile(seller: widget.product.seller),
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
