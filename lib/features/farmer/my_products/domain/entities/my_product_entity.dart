import 'package:equatable/equatable.dart';

class MyProductEntity extends Equatable {
  final int productId;
  final String productName;
  final String? categoryName;
  final String productDescription;
  final double productPrice;
  final String productAvailability;
  final String sellerName;
  final double? productRating;
  final List<String> productImages;

  const MyProductEntity({
    required this.productId,
    required this.productName,
    this.categoryName,
    required this.productDescription,
    required this.productPrice,
    required this.productAvailability,
    required this.sellerName,
    this.productRating,
    required this.productImages,
  });

  @override
  List<Object?> get props => [
        productId,
        productName,
        categoryName,
        productDescription,
        productPrice,
        productAvailability,
        sellerName,
        productRating,
        productImages,
      ];
}
