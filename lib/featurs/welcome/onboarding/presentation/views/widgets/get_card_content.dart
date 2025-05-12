import 'package:crop_guard/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/app_text_styles.dart';

class GetCardsContent extends StatelessWidget {
  final String image;
  final String cardContent;
  final String subtitle;

  const GetCardsContent({
    super.key,
    required this.image,
    required this.cardContent,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 300.w,
            height: 300.h,
          ),
          verticalSpace(30),
          Text(
            cardContent,
            style: AppTextStyles.font20BlackBold,
            textAlign: TextAlign.center,
          ),
          verticalSpace(15),
          Text(
            subtitle,
            style: AppTextStyles.font16GreyBold,
            textAlign: TextAlign.center,
          ),
          verticalSpace(50),
        ],
      ),
    );
  }
}
