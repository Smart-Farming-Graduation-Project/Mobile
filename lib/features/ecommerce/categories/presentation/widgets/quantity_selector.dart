import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove, color: Colors.red, size: 30),
          onPressed: onDecrement,
        ),
        CircleAvatar(
          radius: 20,
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[200],
          child: Text('$quantity',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        IconButton(
          icon: const Icon(Icons.add, color: Colors.green, size: 30),
          onPressed: onIncrement,
        ),
      ],
    );
  }
}
