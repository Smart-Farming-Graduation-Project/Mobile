// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchBarFilter extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchBarFilter({
    super.key,
    this.onChanged,
    this.isGoogleMap = false,
  });
  final bool isGoogleMap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: isGoogleMap ? Colors.white : Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        hintText: "Search",
        hintStyle: isGoogleMap
            ? TextStyle(color: Colors.grey[600], fontSize: 18)
            : TextStyle(
                color: Colors.grey[600],
              ),
        prefixIcon: Icon(Icons.search,
            size: 28, color: isGoogleMap ? Colors.grey[600] : Colors.green),
        suffixIcon: const Icon(
          Icons.keyboard_voice_rounded,
          size: 28,
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: isGoogleMap ? 20 : 14, horizontal: 20),
      ),
    );
  }
}
