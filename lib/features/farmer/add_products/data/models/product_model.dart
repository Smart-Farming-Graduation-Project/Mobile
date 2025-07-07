import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.name,
    required super.description,
    required super.price,
    required super.quantity,
    required super.category,
    required super.images,
    required super.isAvailable,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      quantity: json['quantity'],
      category: json['categoryName'],
      isAvailable: json['availability'] == 'Sale',
      images: json['images'] != null ? json['images'].cast<String>() : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'categoryName': category,
      'availability': isAvailable ? 'Sale' : 'Lease',
    };
  }
}
