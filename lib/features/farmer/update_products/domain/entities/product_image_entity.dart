import 'dart:io';

class ProductImageEntity {
  final String? imageUrl;
  final File? imageFile;
  final bool isExisting;

  const ProductImageEntity({
    this.imageUrl,
    this.imageFile,
    required this.isExisting,
  });

  // Factory constructor for existing images (URLs)
  factory ProductImageEntity.fromUrl(String url) {
    return ProductImageEntity(
      imageUrl: url,
      imageFile: null,
      isExisting: true,
    );
  }

  // Factory constructor for new images (Files)
  factory ProductImageEntity.fromFile(File file) {
    return ProductImageEntity(
      imageUrl: null,
      imageFile: file,
      isExisting: false,
    );
  }

  // Get display image - returns URL for existing images, file path for new images
  String get displayImage {
    if (isExisting && imageUrl != null) {
      return imageUrl!;
    } else if (!isExisting && imageFile != null) {
      return imageFile!.path;
    }
    return '';
  }

  // Check if this is a network image
  bool get isNetworkImage => isExisting && imageUrl != null;

  // Check if this is a file image
  bool get isFileImage => !isExisting && imageFile != null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductImageEntity &&
        other.imageUrl == imageUrl &&
        other.imageFile == imageFile &&
        other.isExisting == isExisting;
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^ imageFile.hashCode ^ isExisting.hashCode;
  }
}
