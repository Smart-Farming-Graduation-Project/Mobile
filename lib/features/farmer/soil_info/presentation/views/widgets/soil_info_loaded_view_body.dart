import 'package:crop_guard/features/farmer/soil_info/presentation/views/widgets/soil_quality_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoilInfoLoadedViewBody extends StatelessWidget {
  const SoilInfoLoadedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const Column(
        children: [
          SoilQualityCard(),
        ],
      ),
    );
  }
}
