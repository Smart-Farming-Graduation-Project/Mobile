import 'package:flutter/material.dart';

class OrderStatus {
  final String title;
  final String time;
  final IconData icon;
  final bool isActive;

  OrderStatus({required this.title, required this.time, required this.icon, required this.isActive});


}
final List<OrderStatus> statuses =  [

 OrderStatus(title: "Order Placed", time: "19 Dec 2023, 11:25 PM", icon:  Icons.shopping_cart, isActive: true),
  OrderStatus(title: "In Progress", time: "19 Dec 2023, 12:25 PM", icon:  Icons.sync, isActive: true),
  OrderStatus(title: "Shipped", time: "19 Dec 2023, 01:05 PM", icon:  Icons.local_shipping, isActive: false),
  OrderStatus(title: "Delivered", time: "19 Dec 2023, 06:00 PM", icon:  Icons.home, isActive: false),

];