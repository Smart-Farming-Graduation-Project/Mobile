import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddressButton extends StatelessWidget {
  const AddressButton({
    super.key,
    required this.isAddressSelected,
    required this.subtotalPrice,
  });
  final bool isAddressSelected;
  final double subtotalPrice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: () {
          if (isAddressSelected) return;
          GoRouter.of(context)
              .push(AppRouter.confirmDeliveryLocation, extra: subtotalPrice);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          foregroundColor: AppColors.kWhiteColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: isAddressSelected
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.payment_outlined,
                    size: 20.sp,
                  ),
                  horizontalSpace(8),
                  Text(
                    'Proceed to Payment',
                    style: AppTextStyles.font16WhiteSemiBold,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 20.sp,
                  ),
                  horizontalSpace(8),
                  Text(
                    "Select your address",
                    style: AppTextStyles.font16WhiteSemiBold,
                  ),
                ],
              ),
      ),
    );
  }
}
