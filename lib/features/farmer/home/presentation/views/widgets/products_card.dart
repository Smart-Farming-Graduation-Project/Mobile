import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/base_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/shopping-cart.svg',
            width: 20.w,
            height: 20.h,
          ),
          horizontalSpace(12),
          Text(
            'My Products',
            style: AppTextStyles.font16TextBlackSemiBold,
          ),
          const Spacer(),
          Text(
            '100 Items',
            style: AppTextStyles.font14TextGrayRegular,
          ),
        ],
      ),
    );
  }
}
