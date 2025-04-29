import 'package:flutter/material.dart';

class PriceDisplay extends StatelessWidget {
  final double price;

  const PriceDisplay({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${price}0 EGP',
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
