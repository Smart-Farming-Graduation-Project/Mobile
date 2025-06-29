import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/cubits/product_item_cubit.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/cubits/product_item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/theme/app_colors.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductItemCubit, ProductItemState>(
      listener: (context, state) {
        if (state is AddingProductToCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.kPrimaryColor,
              content: Text(state.message),
            ),
          );
        } else if (state is AddingProductToCartFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.kDangerColor,
              content: Text(state.message),
            ),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.productName,
              style: const TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${product.productPrice} EGP',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  context.read<ProductItemCubit>().addToCart(product.productId);
                },
                child: BlocBuilder<ProductItemCubit, ProductItemState>(
                  builder: (context, state) {
                    return Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: state is ProductItemLoading
                          ? const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: CircularProgressIndicator(
                                color: AppColors.kWhiteColor,
                              ),
                            )
                          : const Icon(Icons.add,
                              color: AppColors.kWhiteColor, size: 26),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
