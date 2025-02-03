import 'package:flutter/material.dart';

import '../../models/category_model.dart';

class CategorySelection extends StatefulWidget {
  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  int selectedIndex = 0; // Default selection index

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ActionChip(
                label: Text(
                  category.categoryName,
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: selectedIndex == index ? Colors.green : Colors.grey[200],
                onPressed: () {
                  setState(() {
                    selectedIndex = selectedIndex == index ? -1 : index;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

