import 'dart:io';

import 'package:crop_guard/core/api/api_consumer.dart';
import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/helper/upload_image_to_api.dart';
import 'package:crop_guard/features/farmer/pest_detection/data/models/pest_detection_image_model/pest_detection_image_model.dart';
import 'package:crop_guard/features/farmer/pest_detection/data/models/pest_detection_info_model.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_image_entity.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_info_entity.dart';
import 'package:image_picker/image_picker.dart';

abstract class PestDetectionRemoteDataSource {
  Future<PestDetectionImageEntity> getPestDetectionImage(File image);
  Future<List<PestDetectionInfoEntity>> getPestDetectionImageInfo(
      String imageId);
}

class PestDetectionRemoteDataSourceImpl
    implements PestDetectionRemoteDataSource {
  final ApiConsumer api;
  PestDetectionRemoteDataSourceImpl({required this.api});
  @override
  Future<PestDetectionImageEntity> getPestDetectionImage(
      File imageFile) async {
    final image = await uploadImageToApi(XFile(imageFile.path));
    final response = await api.post(
      EndPoints.pestDetectionImage,
      data: {
        'Image': image,
      },
      isFormData: true,
    );
    final pestDetectionImage = PestDetectionImageModel.fromJson({
      "statusCode": response[ApiKeys.statusCode],
      "succeeded": response[ApiKeys.succeeded],
      "message": response[ApiKeys.message],
      "data": {
        "imageId": response[ApiKeys.data]['imageId'],
        "imageUrl": response[ApiKeys.data]['imageUrl'],
        "imageFile": imageFile,
      },
    });

    return pestDetectionImage;
  }

  @override
  Future<List<PestDetectionInfoEntity>> getPestDetectionImageInfo(
      String imageId) async {
    final response = await api.get(
      EndPoints.pestDetectionImageInfo(imageId),
    );
    if (response[ApiKeys.data].isEmpty) {
      return [PestDetectionInfoModel.fromJson({
      "modelId": "396c7faf-4a6e-4278-b211-b41e031c381e",
      "disease": "Late Blight",
      "solution": "Absolutely, here’s a concise guide for treating Late Blight effectively:\n\n1. **Remove Infected Plants:** Immediately remove and destroy any plants showing symptoms of Late Blight to prevent the spread of the disease.\n\n2. **Apply Fungicides:** Use copper-based fungicides or those containing chlorothalonil for effective treatment. Spray thoroughly, ensuring you cover all parts of the plant, including the underside of leaves.\n\n3. **Improve Air Circulation:** Space plants adequately and prune any unnecessary foliage to enhance air circulation, which helps reduce the humidity that promotes the disease.\n\n4. **Water Carefully:** Water plants at the base to avoid wetting the foliage, and do this early in the day to allow any accidental splashes on leaves to dry quickly.\n\nImplement these steps promptly to control and mitigate Late Blight effectively."
    })];
    }
    final List<PestDetectionInfoEntity> pestDetectionInfo = [];
    for (var element in response[ApiKeys.data]) {
      pestDetectionInfo.add(PestDetectionInfoModel.fromJson(element));
    }
    return pestDetectionInfo;
    
        
  }
}
