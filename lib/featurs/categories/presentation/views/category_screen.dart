import 'package:flutter/material.dart';
import 'widgets/category_filter.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '\n Category',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CategorySelection(),
            SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}
