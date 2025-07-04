import 'package:crop_guard/core/api/api_keys.dart';
import '../../domain/entities/my_product_entity.dart';

class MyProductModel extends MyProductEntity {
  const MyProductModel({
    required super.productId,
    required super.productName,
    super.categoryName,
    required super.productDescription,
    required super.productPrice,
    required super.productAvailability,
    required super.sellerName,
    super.productRating,
    required super.productImages,
  });

  factory MyProductModel.fromJson(Map<String, dynamic> json) {
    return MyProductModel(
      productId: json[ApiKeys.productId] ?? 0,
      productName: json[ApiKeys.productName] ?? "",
      categoryName: json[ApiKeys.categoryName],
      productDescription: json[ApiKeys.productDescription] ?? "",
      productPrice: (json[ApiKeys.productPrice] ?? 0.0).toDouble(),
      productAvailability: json[ApiKeys.productAvailability] ?? "available",
      sellerName: json[ApiKeys.sellerName] ?? "",
      productRating: json[ApiKeys.productRating]?.toDouble(),
      productImages: List<String>.from(json[ApiKeys.productImages] ?? []),
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
