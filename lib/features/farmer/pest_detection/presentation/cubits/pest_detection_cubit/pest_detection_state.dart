import 'dart:io';

import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_image_entity.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_info_entity.dart';

class PestDetectionState {}

class PestDetectionInitial extends PestDetectionState {}

class PestDetectionImageSelected extends PestDetectionState {
  final File image;
  PestDetectionImageSelected({required this.image});
}

class PestDetectionLoading extends PestDetectionState {
  final File image;
  PestDetectionLoading({required this.image});
}

class PestDetectionLoaded extends PestDetectionState {
  final PestDetectionImageEntity pestDetectionImage;
  final PestDetectionInfoEntity pestDetectionInfo;

  PestDetectionLoaded(
      {required this.pestDetectionImage, required this.pestDetectionInfo});
}

class PestDetectionFailure extends PestDetectionState {
  final String message;
  final File? image;

  PestDetectionFailure({required this.message, this.image});
}
