
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
      productId: json["productId"] ?? 0,
      productName: json["productName"] ?? "productName",
      categoryName: json["categoryName"] ?? "categoryName",
      productDescription:
          json["productDescription"] ?? "productDescription",
      productPrice: json["productPrice"] ?? 0.0,
      productAvailability: json["productAvailability"] ?? "Sale",
      sellerName: json["sellerName"] ?? "sellerName",
      productRating: json["productRating"]?.toDouble(),
      isFavorite: json["isFavorite"] ?? true,
      productImages: List<String>.from(json["productImages"] ?? []),
    );
  }
}
