import 'package:flutter/material.dart';

class PostTitleInput extends StatelessWidget {
  const PostTitleInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 300,
      decoration: InputDecoration(

        labelText: 'Title',
        labelStyle: const TextStyle(color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
