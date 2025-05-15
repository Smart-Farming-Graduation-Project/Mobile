import 'package:crop_guard/featurs/farmer/home/widgets/home_app_bar.dart';
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
            const HomeAppBar(userName: 'Noha Ahmed'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: const Column(
                  children: [
                    TipCard(),
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
