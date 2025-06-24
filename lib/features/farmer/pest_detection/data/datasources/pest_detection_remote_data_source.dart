import 'package:crop_guard/core/api/api_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/helper/upload_image_to_api.dart';
import 'package:crop_guard/features/farmer/pest_detection/data/models/pest_detection_image_model/pest_detection_image_model.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_image_entity.dart';
import 'package:image_picker/image_picker.dart';

abstract class PestDetectionRemoteDataSource {
  Future<PestDetectionImageEntity> getPestDetectionImage(XFile image);
  Future<List<PestDetectionImageEntity>> getPestDetectionImageInfo(
      String imageId);
}

class PestDetectionRemoteDataSourceImpl
    implements PestDetectionRemoteDataSource {
  final ApiConsumer api;
  PestDetectionRemoteDataSourceImpl({required this.api});
  @override
  Future<PestDetectionImageEntity> getPestDetectionImage(
      XFile imageFile) async {
    final image = await uploadImageToApi(imageFile);
    final response = await api.post(
      EndPoints.pestDetectionImage,
      data: {
        'Image': image,
      },
      isFormData: true,
    );
    return response;
  }

  @override
  Future<List<PestDetectionImageEntity>> getPestDetectionImageInfo(
      String imageId) async {
    final response = await api.get(
      EndPoints.pestDetectionImageInfo(imageId),
    );

    return (response as List)
        .map((e) => PestDetectionImageModel.fromJson(e))
        .toList();
  }
}
