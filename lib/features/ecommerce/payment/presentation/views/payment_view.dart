import 'package:crop_guard/core/helper/build_app_bar.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/cubits/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/views/payment_view_body.dart';
import 'package:flutter/material.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColors.kBackgroundGray,
    appBar: buildAppBar(context, title: 'Payment'),
    body: BlocProvider(
      create: (context) => getIt<StripePaymentCubit>(),
      child: const PaymentViewBody(),
    ),
  );
  }

}

