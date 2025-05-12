import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/app_colors.dart';

class FarmerRole extends StatelessWidget {
  final bool isSelected;

  const FarmerRole({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final Color containerColor =
        isSelected ? AppColors.kPrimaryColor : AppColors.kWhiteColor;
    final Color personColor =
        isSelected ? AppColors.kWhiteColor : AppColors.kGrayColor;

    return Container(
      width: 150.w,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color:
            isSelected ? AppColors.kPrimaryColor : Colors.black.withAlpha(15),
        boxShadow: isSelected
            ? [const BoxShadow(color: Colors.black26, blurRadius: 5)]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.person, size: 100.r, color: personColor),
              Positioned(
                bottom: 13.h,
                right: 9.w,
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: containerColor,
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: personColor,
                    child: Icon(Icons.agriculture_outlined,
                        size: 20.r, color: containerColor),
                  ),
                ),
              )
            ],
          ),
          Text('Farmer',
              style:
                  AppTextStyles.font20BlackBold.copyWith(color: personColor)),
        ],
      ),
    );
  }
}
