import 'package:flutter/material.dart';

class OrderStatusTimeline extends StatelessWidget {
  const OrderStatusTimeline({super.key});

  final List<_OrderStatus> _statuses = const [
    _OrderStatus("Order Placed", "19 Dec 2023, 11:25 PM", Icons.shopping_cart, isActive: true),
    _OrderStatus("In Progress", "19 Dec 2023, 12:25 PM", Icons.sync, isActive: true),
    _OrderStatus("Shipped", "19 Dec 2023, 01:05 PM", Icons.local_shipping, isActive: false),
    _OrderStatus("Delivered", "19 Dec 2023, 06:00 PM", Icons.home, isActive: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(_statuses.length, (index) {
        final status = _statuses[index];
        final isLast = index == _statuses.length - 1;

        Color iconColor;
        double iconSize;
        if (status.isActive && status.title == "Order Placed") {
          iconColor = Colors.green;
          iconSize = 12.0;
        } else if(status.isActive && status.title == "In Progress" ) {
          iconColor = Colors.yellow.shade500;
          iconSize = 22.0;
        } else {
          iconColor = Colors.grey;
          iconSize = 12.0;
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconColor,
                    boxShadow: [
                      if (status.isActive)
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 6,
                          spreadRadius: 2,
                        ),
                    ],
                  ),
                  child: Icon(
                    status.icon,
                    color: Colors.white,
                    size: iconSize,
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 40,
                    color: iconColor,
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      status.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: iconColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      status.time,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _OrderStatus {
  final String title;
  final String time;
  final IconData icon;
  final bool isActive;

  const _OrderStatus(this.title, this.time, this.icon, {this.isActive = false});
}
