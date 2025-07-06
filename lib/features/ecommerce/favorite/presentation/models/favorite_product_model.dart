import 'package:crop_guard/core/api/api_keys.dart';

class FavoriteProductModel {
  int productId;
  final String productName;
  final String? categoryName;
  final String productDescription;
  final double productPrice;
  final String productAvailability;
  final String sellerName;
  final double? productRating;
  bool isFavorite;
  final List<String> productImages;

  FavoriteProductModel(
      {required this.productId,
      required this.productName,
      this.categoryName,
      required this.productDescription,
      required this.productPrice,
      required this.productAvailability,
      required this.sellerName,
      this.productRating,
      required this.isFavorite,
      required this.productImages});
  factory FavoriteProductModel.fromJson(Map<String, dynamic> json) {
    return FavoriteProductModel(
      productId: json[ApiKeys.productId] ?? 0,
      productName: json[ApiKeys.productName] ?? "productName",
      categoryName: json[ApiKeys.categoryName] ?? "categoryName",
      productDescription:
          json[ApiKeys.productDescription] ?? "productDescription",
      productPrice: json[ApiKeys.productPrice] ?? 0.0,
      productAvailability: json[ApiKeys.productAvailability] ?? "available",
      sellerName: json[ApiKeys.sellerName] ?? "sellerName",
      productRating: json[ApiKeys.productRating]?.toDouble(),
      isFavorite: json[ApiKeys.isFavorite] ?? true,
      productImages: List<String>.from(json[ApiKeys.productImages] ?? []),
    );
  }
}
