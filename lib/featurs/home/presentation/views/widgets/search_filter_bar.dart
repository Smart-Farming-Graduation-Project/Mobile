import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class SearchBarf extends StatelessWidget {
  const SearchBarf({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
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
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Symbols.instant_mix, size: 40, color: Colors.green),
          ),
        ],
      );




  }
}
