import 'package:crop_guard/featurs/categories/presentation/manger/category_cubit/category_cubit.dart';
import 'package:crop_guard/featurs/categories/presentation/manger/category_cubit/category_state.dart';
import 'package:crop_guard/featurs/categories/presentation/manger/helper/categories_list.dart';
import 'package:crop_guard/featurs/categories/presentation/views/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        final controller = TextEditingController();
        final filteredCategories = categoriesList
            .where((category) => category.categoryName
                .toLowerCase()
                .contains(controller.text.toLowerCase()))
            .toList();
        return ListView.builder(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: filteredCategories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                height: 100,
                child: CategoryCard(
                  categorie: filteredCategories[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
