import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'sensor_status_indicator.dart';

class SensorCardHeader extends StatelessWidget {
  const SensorCardHeader({
    super.key,
    required this.title,
    required this.isOk,
  });

  final String title;
  final bool isOk;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.sensorCardTitle,
          ),
        ),
        SensorStatusIndicator(isOk: isOk),
      ],
    );
  }
}
