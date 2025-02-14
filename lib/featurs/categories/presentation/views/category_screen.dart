import 'package:crop_guard/featurs/home/presentation/views/widgets/category_button.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '\n Category',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Poppins'),
        ),        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child:  Column(
          children: [
            CategorySelection(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}