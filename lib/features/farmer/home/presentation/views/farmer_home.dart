import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/add_product_button.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/features_grid.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/header_section.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/products_card.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/tip_card.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FarmerHomeScreen extends StatelessWidget {
  const FarmerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundGray,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              verticalSpace(22),
              const TipCard(),
              verticalSpace(14),
              const WeatherCard(),
              verticalSpace(14),
              const ProductsCard(),
              verticalSpace(18),
              const FeaturesGrid(),
              verticalSpace(14),
              const AddProductButton(),
            ],
          ),
        ),
      ),
    );
  }
}
