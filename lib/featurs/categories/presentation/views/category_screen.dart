import 'package:crop_guard/core/utils/routing/app_router.dart';
import 'package:crop_guard/featurs/home/presentation/views/widgets/category_button.dart';
import 'package:crop_guard/featurs/home/presentation/views/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../home/presentation/models/recommended_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Category',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Poppins'),
        ),        centerTitle: true,
        elevation: 0,
        leading: IconButton(onPressed: (){
          GoRouter.of(context).go(AppRouter.home);
        }, icon: const Icon(Icons.arrow_back_ios),
      ),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:  Column(
          children: [
            const CategorySelection(),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return ItemCard(item: items[index]);
              },
                        ),
            )
          ],
        ),
      ),
    );
  }
}