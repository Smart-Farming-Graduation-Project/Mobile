import 'dart:io';

class ProductEntity {
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String category;
  final List<File> images;
  final bool isAvailable;

  const ProductEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.images,
    required this.isAvailable,
  });

  ProductEntity copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    int? quantity,
    String? category,
    List<File>? images,
    bool? isAvailable,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductEntity(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
      images: images ?? this.images,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}
