import 'package:flutter/material.dart';
class SearchBarf extends StatelessWidget {
  const SearchBarf({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(left:  10, right: 10),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            hintText: "Search",
            prefixIcon: const Icon(Icons.search, size: 28, color: Colors.green),
            suffixIcon: const Icon(Icons.keyboard_voice_rounded, size: 28, color: Colors.black),
          ),
        ),
      );




  }
}
