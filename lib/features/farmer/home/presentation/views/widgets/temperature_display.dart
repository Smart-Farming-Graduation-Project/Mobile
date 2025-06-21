import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TemperatureDisplay extends StatelessWidget {
  const TemperatureDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '10°C',
      style: AppTextStyles.font46BlackBold,
    );
  }
}
