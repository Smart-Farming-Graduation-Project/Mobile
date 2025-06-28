import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SensorValueDisplay extends StatelessWidget {
  const SensorValueDisplay({
    super.key,
    required this.value,
    required this.unit,
    required this.isOk,
  });

  final String value;
  final String unit;
  final bool isOk;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          value,
          style: AppTextStyles.sensorCardValue.copyWith(
            color: _getStatusColor(),
          ),
        ),
        horizontalSpace(4),
        Text(
          unit,
          style: AppTextStyles.sensorCardUnit,
        ),
      ],
    );
  }

  Color _getStatusColor() {
    return isOk ? AppColors.kGreenColor : AppColors.kDangerColor;
  }
}
