import 'package:crop_guard/core/theme/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CropGuardLogo extends StatelessWidget {
  const CropGuardLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Image.asset(
        AssetsData.greenlogo,
        height: 90.h,
        scale: 0.8,
      ),
    );
  }
}
