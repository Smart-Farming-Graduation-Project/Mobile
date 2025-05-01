import 'package:crop_guard/featurs/ecommerce/categories/presentation/manger/helper/categories_list.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/views/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
}
