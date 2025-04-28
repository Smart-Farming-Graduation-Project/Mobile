import 'package:crop_guard/featurs/categories/presentation/manger/category_cubit/category_cubit.dart';
import 'package:crop_guard/featurs/categories/presentation/manger/category_cubit/category_state.dart';
import 'package:crop_guard/featurs/categories/presentation/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/presentation/views/widgets/search_filter_bar.dart';
import 'widgets/product_item.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..loadCategoriesProducts(category.categoryId),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          elevation: 0,
          title: Text(
            category.categoryName,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Poppins'),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => GoRouter.of(context).pop(),
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
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Symbols.instant_mix,
                      color: AppColors.kPrimaryColor,
                      size: 34,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.kPrimaryColor,
                        ),
                      );
                    } else if (state is CategoryError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 48,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              state.error,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                context.read<CategoryCubit>().loadCategoriesProducts(category.categoryId);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.kPrimaryColor,
                              ),
                              child: const Text('Retry', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      );
                    } else if (state is CategorySuccess) {
                      final products = state.products;
                      
                      return GridView.builder(
                        padding: const EdgeInsets.all(12.0),
                        itemCount: products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          return ProductItem(product: products[index]);
                        },
                      );
                    } else if (state is CategoryEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.category_outlined,
                              color: Colors.grey,
                              size: 64,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No products available in this category',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }
                    
                    // Handle any unexpected states
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.amber,
                            size: 48,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Unexpected error occurred.\nPlease try again later.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}