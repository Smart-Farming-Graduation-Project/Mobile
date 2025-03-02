import 'package:crop_guard/core/responsive/widget_height.dart';
import 'package:crop_guard/core/responsive/widget_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manger/cubit/product_cubit.dart';
import '../../models/category_model.dart';
import '../category_products_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categorie});
  final CategoryModel categorie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(

            builder: (context) => BlocProvider(
              create: (context) => ProductCubit()..getProductsByCategory(categorie.categoryName),
              child: CategoryProductsScreen(categoryName: categorie.categoryName),
            ),
          ),
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
          child: Image.asset(categorie.image,

          ),
        ),
        const SizedBox(height: 5),
        Text(
          categorie.categoryName,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Poppins',),
        ),
      ],
    )
    );
  }
}
