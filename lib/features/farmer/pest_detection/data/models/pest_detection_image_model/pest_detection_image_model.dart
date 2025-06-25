import 'dart:io';

import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_image_entity.dart';

import 'data.dart';

class PestDetectionImageModel extends PestDetectionImageEntity {
  int? statusCode;
  bool? succeeded;
  String? message;
  Data? data;
  dynamic meta;

  PestDetectionImageModel({
    this.statusCode,
    this.succeeded,
    this.message,
    this.data,
    this.meta,
  }) : super(
          imagePath: data?.imageUrl ?? '',
          imageId: data?.imageId ?? '',
          imageFile: data?.imageFile ?? File(''),
        );

  factory PestDetectionImageModel.fromJson(Map<String, dynamic> json) {
    return PestDetectionImageModel(
      statusCode: json['statusCode'] as int?,
      succeeded: json['succeeded'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'succeeded': succeeded,
        'message': message,
        'data': data?.toJson(),
        'meta': meta,
      };
}
