import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/base_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TipCard extends StatelessWidget {
  const TipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/lamp-on.svg',
                width: 20.w,
                height: 20.h,
              ),
              horizontalSpace(8),
              Text(
                "Today's Tip",
                style: AppTextStyles.font16BlackSemiBold,
              ),
            ],
          ),
          verticalSpace(11),
          Text(
            'Water early in the morning to reduce evaporation and disease.',
            style: AppTextStyles.font14TextGrayRegular,
          ),
        ],
      ),
    );
  }
}
