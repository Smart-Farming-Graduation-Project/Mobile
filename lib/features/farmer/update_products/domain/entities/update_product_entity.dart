import 'dart:io';
import 'package:crop_guard/features/farmer/update_products/domain/entities/product_image_entity.dart';

class UpdateProductEntity {
  final String id;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String category;
  final List<ProductImageEntity> images;
  final bool isAvailable;

  const UpdateProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.images,
    required this.isAvailable,
  });

  // Get only new images (Files) for API upload
  List<File> get newImages {
    return images
        .where((image) => image.isFileImage)
        .map((image) => image.imageFile!)
        .toList();
  }

  // Get only existing image URLs that should be kept
  List<String> get existingImageUrls {
    return images
        .where((image) => image.isNetworkImage)
        .map((image) => image.imageUrl!)
        .toList();
  }

  UpdateProductEntity copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    int? quantity,
    String? category,
    List<ProductImageEntity>? images,
    bool? isAvailable,
  }) {
    return UpdateProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
      images: images ?? this.images,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}
