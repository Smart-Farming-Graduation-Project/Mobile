import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/views/widgets/soil_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoilQualityCard extends StatelessWidget {
  const SoilQualityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.kGrayColor, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.h,
            children: [
              Text('Soil Quality', style: AppTextStyles.font16BlackRegular),
              Text('Good', style: AppTextStyles.font32BlackBold),
              Text('Last 10 days', style: AppTextStyles.font16GreenRegular),
              SizedBox(height: 16.h),
              const SoilChart(),
            ],
          ),
        ),
      ),
    );
  }
}
