import 'dart:io';

class PestDetectionImageEntity {
  final String imagePath;
  final String imageId;
  final File imageFile;

  PestDetectionImageEntity({
    required this.imagePath,
    required this.imageId,
    required this.imageFile,
  });
}
