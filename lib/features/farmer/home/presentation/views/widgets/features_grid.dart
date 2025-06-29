import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/quick_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FeaturesGrid extends StatelessWidget {
  const FeaturesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1,
        children: [
          QuickCard(
              icon: "people",
              title: 'Community',
              onTap: () {
                GoRouter.of(context).push(AppRouter.community);
              }),
          QuickCard(
              icon: "GameController",
              title: 'Rover Control',
              onTap: () {
                GoRouter.of(context).push(AppRouter.roverControl);
              }),
          QuickCard(
              icon: "shop",
              title: 'Market',
              onTap: () {
                GoRouter.of(context).push(AppRouter.home);
              }),
          QuickCard(
              icon: "bug",
              title: 'Pest Detection',
              onTap: () {
                GoRouter.of(context).push(AppRouter.pestDetection);
              }),
          QuickCard(
              icon: "robot",
              title: 'Chat Bot',
              onTap: () {
                GoRouter.of(context).push(AppRouter.chatBot);
              }),
          QuickCard(
              icon: "soil",
              title: 'Soil Info',
              onTap: () {
                GoRouter.of(context).push(AppRouter.soilInfo);
              }),
        ],
      ),
    );
  }
}
