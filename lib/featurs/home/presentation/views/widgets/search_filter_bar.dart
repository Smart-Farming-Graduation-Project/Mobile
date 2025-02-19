import 'package:flutter/material.dart';

class SearchBarFilter extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchBarFilter({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: const Icon(Icons.search, size: 28, color: Colors.green),
        suffixIcon: const Icon(Icons.keyboard_voice_rounded, size: 28,),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
    );
  }
}


