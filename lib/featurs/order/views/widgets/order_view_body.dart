import 'package:crop_guard/featurs/order/views/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Orders",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: const Column(
        children: [
          OrderCard(),
        ],
      ),
    );
  }
}
