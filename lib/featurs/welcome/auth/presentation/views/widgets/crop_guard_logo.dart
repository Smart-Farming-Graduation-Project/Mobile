import 'package:crop_guard/core/theme/assets_data.dart';
import 'package:flutter/material.dart';

class CropGuardLogo extends StatelessWidget {
  const CropGuardLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Image.asset(
        AssetsData.greenlogo,
        height: 90,
        scale: 0.8,
      ),
    );
  }
}
