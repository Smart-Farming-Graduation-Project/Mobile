import 'package:flutter/material.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
          ),
          hintText: 'Type your message here',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
