import 'package:crop_guard/features/ecommerce/order/presentation/widgets/order_detail_tile.dart';
import 'package:crop_guard/features/ecommerce/order/presentation/widgets/order_status_timelines.dart';
import 'package:crop_guard/features/ecommerce/order/presentation/widgets/product_summary.dart';
import 'package:flutter/material.dart';

import 'order_delivery_info_screen.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "Track Order",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const OrderDetailTile(
              expectedDate: "19 April 2025",
              orderId: "BKR45HGJFN",
            ),
            const SizedBox(height: 5),
            const ProductSummary(),
            const SizedBox(height: 5),
            const Text(
              "Order Status",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const OrderStatusTimeline(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderDeliveryInfoScreen()),
                );
              },
              child: const Text(
                "More Details",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
