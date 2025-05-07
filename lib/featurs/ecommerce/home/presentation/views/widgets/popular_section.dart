import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/core/responsive/widget_height.dart';
import 'package:crop_guard/core/responsive/widget_width.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/manger/category_cubit/product_cubit.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: BlocBuilder<ProductCubit, List<ProductModel>>(
        builder: (context, productList) {
          return SizedBox(
            height: widgetHeight(context: context, height: 120),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: SizedBox(
                    width: widgetWidth(context: context, width: 153),
                    child: ProductItem(product: productList[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
