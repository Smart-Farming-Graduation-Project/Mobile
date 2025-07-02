import 'package:crop_guard/features/farmer/update_products/domain/entities/product_image_entity.dart';
import '../../domain/entities/update_product_entity.dart';

class UpdateProductModel extends UpdateProductEntity {
  const UpdateProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.quantity,
    required super.category,
    required super.images,
    required super.isAvailable,
  });

  factory UpdateProductModel.fromJson(Map<String, dynamic> json) {
    List<ProductImageEntity> images = [];

    if (json['images'] != null) {
      final imageUrls = json['images'].cast<String>();
      images = imageUrls.map((url) => ProductImageEntity.fromUrl(url)).toList();
    }

    return UpdateProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      quantity: json['quantity'],
      category: json['categoryName'],
      isAvailable: json['availability'] == 'Sale',
      images: images,
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
      'images': existingImageUrls,
    };
  }
}
