import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/cubits/categories_cubit.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/cubits/categories_state.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoriesError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is CategoriesEmpty) {
            return const Center(
              child: Text('No categories available'),
            );
          } else if (state is CategoriesLoaded) {
            final categoriesList = state.categories;
            return ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    height: 100,
                    child: CategoryCard(
                      category: categoriesList[index],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
