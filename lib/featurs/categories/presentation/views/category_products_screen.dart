import 'package:crop_guard/featurs/categories/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/presentation/views/widgets/search_filter_bar.dart';
import '../../manger/cubit/product_cubit.dart';
import '../models/product_model.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryName;
  const CategoryProductsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
        title: Text(
          categoryName,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
              fontFamily: 'Poppins'),
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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
             Row(
               children: [
                 const Expanded(child: SearchBarFilter()),
                 IconButton(onPressed: (){}, icon: const Icon( Symbols.instant_mix,color:AppColors.kPrimaryColor,
                   size: 34,))
               ],
             ),

            Expanded(
              child: BlocBuilder<ProductCubit, List<ProductModel>>(
                builder: (context, products) {

                  if (products.isEmpty) {
                    return const Center(child: Text("No Products Available"));
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.all(12.0),
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
