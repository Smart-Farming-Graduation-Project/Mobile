
import 'package:crop_guard/core/utils/Routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/theme/app_colors.dart';
import '../../../../../../core/utils/theme/assets_data.dart';
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
        SplashScreenController(vsync: this, onCompleted: _navigateToOnboarding);
    _controller.startAnimation();
  }

  void _navigateToOnboarding() {
    GoRouter.of(context).go(AppRouter.onboarding);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.primary,
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
                    offset: Offset(_controller.imageAnimation.value, 10,),
                    child: Image.asset(AseetsData.logo, scale: 1.7,),
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
