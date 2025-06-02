import 'package:flutter/material.dart';

class DeliveryInfoHeader extends StatelessWidget {
  const DeliveryInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(
              'assets/images/home/profile.png'), // Replace with your asset
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("John Doe", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Delivery Man"),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.chat)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
      ],
    );
  }
}
