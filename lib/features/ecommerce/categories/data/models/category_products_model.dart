import 'package:crop_guard/core/api/api_keys.dart';

class CategoryProductsModel {
  final int productId;
  final String productName;
  final String productImage;
  final double productPrice;
  final bool isFavorite;

  CategoryProductsModel({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.isFavorite,
  });

  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) {
    return CategoryProductsModel(
      productId: json[ApiKeys.productId] ?? 0,
      productName: json[ApiKeys.productName] ?? "productName",
      productImage: json[ApiKeys.productImages].isNotEmpty
          ? json[ApiKeys.productImages][0]
          : "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
      productPrice: json[ApiKeys.productPrice] ?? 0.0,
      isFavorite: json[ApiKeys.productIsFavorite] ?? false,
    );
  }
}
