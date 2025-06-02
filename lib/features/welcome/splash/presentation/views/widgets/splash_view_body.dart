import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/assets_data.dart';
import '../models/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final SplashScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        SplashScreenController(vsync: this, onCompleted: _navigateToNextPage);
    _controller.startAnimation();
  }

  void _navigateToNextPage() {
    if (getIt<CacheHelper>().getData(key: "isOnboardingVisited") != null) {
      if (getIt<CacheHelper>().getDataString(key: ApiKeys.role) == "Buyer") {
        GoRouter.of(context).go(AppRouter.home);
      } else if (getIt<CacheHelper>().getDataString(key: ApiKeys.role) ==
          "Farmer") {
        GoRouter.of(context).go(AppRouter.farmerHome);
      } else {
        GoRouter.of(context).go(AppRouter.signIn);
      }
    } else {
      GoRouter.of(context).go(AppRouter.onboarding);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: AnimatedBuilder(
        animation: _controller.animationController,
        builder: (context, _) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(
                      _controller.imageAnimation.value,
                      10,
                    ),
                    child: Image.asset(
                      AssetsData.logo,
                      scale: 1.7,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
