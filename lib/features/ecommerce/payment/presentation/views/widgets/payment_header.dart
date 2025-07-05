import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaymentHeader extends StatelessWidget {
  const PaymentHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Complete your payment',
      style: AppTextStyles.font18BlackSemiBold,
    );
  }
}
