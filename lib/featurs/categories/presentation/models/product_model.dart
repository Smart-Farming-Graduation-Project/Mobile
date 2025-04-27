
import 'package:crop_guard/featurs/categories/presentation/models/seller_model.dart';

class ProductModel {
  final int id;
  final String name;
  final String category;
  final String price;
  final String image;
  final String description;
  final SellerModel seller;
  final double rating;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.description,
    required this.seller,
    this.rating = 4.5,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: json['price'].toString(),
      image: json['image'],
      description: json['description'],
      seller: SellerModel.fromJson(json['seller']),
      rating: (json['rating'] as num?)?.toDouble() ?? 4.5,
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'image': image,
      'description': description,
      'seller': seller.toJson(),
      'rating': rating,
      'isFavorite': isFavorite,
    };
  }
}
