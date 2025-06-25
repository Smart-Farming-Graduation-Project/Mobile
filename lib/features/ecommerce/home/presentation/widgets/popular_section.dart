import 'package:crop_guard/core/responsive/widget_width.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/product_item.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/cubits/products_cubit.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/cubits/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getAllProducts(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductsLoaded) {
            return Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: SizedBox(
                      width: widgetWidth(context: context, width: 153),
                      child: ProductItem(product: state.products[index]),
                    ),
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
