import 'package:crop_guard/featurs/categories/presentation/views/widgets/appbar_custom.dart';
import 'package:crop_guard/featurs/categories/presentation/views/widgets/category_card.dart';
import 'package:flutter/material.dart';
import '../../../home/presentation/views/widgets/search_filter_bar.dart';
import '../../manger/cubit/category_cubit.dart';
import '../models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: Scaffold(
        appBar:  const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppbarCustom(
              appbarName: 'Category',
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 16),
              BlocBuilder<CategoryCubit, TextEditingController>(
                builder: (context, controller) {
                  return const SearchBarFilter();
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<CategoryCubit, TextEditingController>(
                  builder: (context, controller) {
      
                    final filteredCategories = categories
                        .where((category) => category.categoryName.toLowerCase()
                            .contains(controller.text.toLowerCase())).toList();
                    return GridView.builder(
                      itemCount: filteredCategories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          categorie: filteredCategories[index],
                        );
                      },
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
