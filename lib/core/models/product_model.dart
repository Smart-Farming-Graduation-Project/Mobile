import 'package:crop_guard/core/api/api_keys.dart';

class ProductModel {
  final int productId;
  final String productName;
  final String? categoryName;
  final String productDescription;
  final double productPrice;
  final String productAvailability;
  final String sellerName;
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
      required this.sellerName,
      this.productRating,
      required this.isFavorite,
      required this.productImages});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json["productId"] ?? 0,
      productName: json["productName"] ?? "productName",
      categoryName: json["categoryName"] ?? "categoryName",
      productDescription:
          json["description"] ?? "productDescription",
      productPrice: json["price"] ?? 0.0,
      productAvailability: json["availability"] ?? "Sale",
      sellerName: json["productOwner"] ?? "sellerName",
      productRating: json["averageRating"]?.toDouble(),
      isFavorite: json["isFavorite"] ?? false,
      productImages: List<String>.from(json["images"] ?? []),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      ApiKeys.productId: productId,
      ApiKeys.productName: productName,
      ApiKeys.categoryName: categoryName,
      ApiKeys.productDescription: productDescription,
      ApiKeys.productPrice: productPrice,
      ApiKeys.productAvailability: productAvailability,
      ApiKeys.sellerName: sellerName,
      ApiKeys.productRating: productRating,
      ApiKeys.productImages: productImages,
    };
  }
}
