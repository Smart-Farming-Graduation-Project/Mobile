import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_image_entity.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_info_entity.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/views/widgets/pest_detection_button.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/views/widgets/pest_detection_image_result.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/views/widgets/selected_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PestDetectionSuccess extends StatelessWidget {
  const PestDetectionSuccess({super.key, required this.pestDetectionImageEntity, required this.pestDetectionInfoEntity});
  final PestDetectionImageEntity pestDetectionImageEntity;
  final PestDetectionInfoEntity pestDetectionInfoEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SelectedImage(height: 150, image: pestDetectionImageEntity.imageFile),
                    verticalSpace(10),
                    Text(
                      'Original Image',
                      style: AppTextStyles.font18BlackRegular,
                    ),
                  ],
                ),
              ),
              horizontalSpace(10),
              Expanded(
                  child: Column(
                children: [
                  PestDetectionImageResult(imageUrl: pestDetectionImageEntity.imagePath),
                  verticalSpace(10),
                  Text(
                    'Result Image',
                    style: AppTextStyles.font18BlackRegular,
                  ),
                ],
              )),
            ],
          ),
          verticalSpace(30),
          Text(
            'Detection Completed',
            style: AppTextStyles.font20BlackBold,
          ),
          verticalSpace(10),
          Text(
            'Pest Type: ${pestDetectionInfoEntity.diseaseName}',
            style: AppTextStyles.font18BlackRegular,
          ),
          verticalSpace(30),
          PestDetectionButton(
            text: 'Try Another Image',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
