import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String imageUrl;

  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [name, description, price, quantity, imageUrl];
}
