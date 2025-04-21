import 'package:flutter/material.dart';

class DeliveryDetailsTile extends StatelessWidget {
  const DeliveryDetailsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          leading: Icon(Icons.store),
          title: Text("Rise & Shine Bakery Co."),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text("1901 Thornridge Cir. Shiloh, Haw..."),
        ),
        ListTile(
          leading: Icon(Icons.access_time),
          title: Text("Estimated Arrival Time"),
          subtitle: Text("05:30 PM - 06:00 PM"),
        ),
      ],
    );
  }
}
