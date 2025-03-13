import 'package:flutter/material.dart';

class ReviewInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;

  const ReviewInputWidget({super.key, required this.controller, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Write your review...",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: onSubmit,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Text("Submit Review"),
        ),
      ],
    );
  }
}
