import 'package:flutter/material.dart';

class StepData {
  final String title;
  final IconData icon;
  final bool isCompleted;

  StepData({
    required this.title,
    required this.icon,
    required this.isCompleted,
  });

  factory StepData.fromJson(Map<String, dynamic> json) {
    return StepData(
      title: json['title'] as String,
      icon: _getIconFromName(json['icon'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  static IconData _getIconFromName(String name) {
    switch (name) {
      case 'shopping_cart':
        return Icons.shopping_cart;
      case 'sync':
        return Icons.sync;
      case 'local_shipping':
        return Icons.local_shipping;
      case 'home':
        return Icons.home;
      default:
        return Icons.circle;
    }
  }
}
