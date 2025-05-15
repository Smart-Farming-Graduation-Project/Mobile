import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/featurs/farmer/home/widgets/add_product_button.dart';
import 'package:crop_guard/featurs/farmer/home/widgets/chat_bot_and_soil_info_row.dart';
import 'package:crop_guard/featurs/farmer/home/widgets/community_and_rover_row.dart';
import 'package:crop_guard/featurs/farmer/home/widgets/home_app_bar.dart';
import 'package:crop_guard/featurs/farmer/home/widgets/market_and_pest_detection_row.dart';
import 'package:crop_guard/featurs/farmer/home/widgets/products_and_weather_row.dart';
import 'package:crop_guard/featurs/farmer/home/widgets/tip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FarmerHomeScreen extends StatelessWidget {
  const FarmerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            verticalSpace(10),
            const HomeAppBar(userName: 'Noha Ahmed'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    const ProductsAndWeatherRow(),
                    verticalSpace(20),
                    const TipCard(),
                    verticalSpace(20),
                    const CommunityAndRoverRow(),
                    verticalSpace(16),
                    const MarketAndPestDetectionRow(),
                    verticalSpace(16),
                    const ChatBotAndSoilInfoRow(),
                    verticalSpace(25),
                    const AddProductButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
