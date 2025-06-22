import 'package:flutter/material.dart';

class AddProductsPage extends StatelessWidget {
  const AddProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text('Add New Product'),
        ),
      ),
    );
  }
}
