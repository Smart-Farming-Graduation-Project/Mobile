import 'package:crop_guard/core/responsive/widget_height.dart';
import 'package:crop_guard/core/responsive/widget_width.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.categoryProducts,
          extra: category,
        );
      },
    child:  Column(
      children: [
        Container(
          width: widgetWidth(context: context, width: 70),
          height: widgetHeight(context: context, height: 50),
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(15),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.asset(category.image,

          ),
        ),
        const SizedBox(height: 5),
        Text(
          category.categoryName,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Poppins',),
        ),
      ],
    )
    );
  }
}
