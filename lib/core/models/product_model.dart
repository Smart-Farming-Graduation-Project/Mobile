import 'package:crop_guard/core/api/api_keys.dart';

class ProductModel {
  final int productId;
  final String productName;
  final String? categoryName;
  final String productDescription;
  final double productPrice;
  final String productAvailability;
  final double? productRating;
  bool isFavorite;
  final List<String> productImages;

  ProductModel(
      {required this.productId,
      required this.productName,
      this.categoryName,
      required this.productDescription,
      required this.productPrice,
      required this.productAvailability,
      this.productRating,
      required this.isFavorite,
      required this.productImages});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json[ApiKeys.productId] ?? 0,
      productName: json[ApiKeys.productName] ?? "productName",
      categoryName: json[ApiKeys.categoryName] ?? "categoryName",
      productDescription:
          json[ApiKeys.productDescription] ?? "productDescription",
      productPrice: json[ApiKeys.productPrice] ?? 0.0,
      productAvailability: json[ApiKeys.productAvailability] ?? "available",
      productRating: json[ApiKeys.productRating]?.toDouble(),
      isFavorite: json[ApiKeys.isFavorite] ?? false,
      productImages: List<String>.from(json[ApiKeys.productImages] ?? []),
    );
  }
}
