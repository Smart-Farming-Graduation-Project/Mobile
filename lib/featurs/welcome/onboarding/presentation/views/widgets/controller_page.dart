import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/routing/app_router.dart';

class OnboardingController {
  final PageController pageController = PageController();
  final List<Map<String, String>> onboardingData = [
    {
      "image": 'assets/images/onboarding/page1.png',
      "cardContent": " Everything You Need,\n Just a Tap Away!",
      "subtitle": "Discover a world of fresh products and hassle-free shopping, tailored to your lifestyle.",
    },
    {
      "image": 'assets/images/onboarding/page2.png',
      "cardContent": "Smart Farming at Your Fingertips!",
      "subtitle": " Stay connected to your farm, track rover movements, and optimize operations—all from your mobile app.",
    },
    {
      "image": 'assets/images/onboarding/page3.png',
      "cardContent": "Grow Together,\n Thrive Together!",
      "subtitle": "Connect with a community of smart farmers, share insights, and optimize your farm with remote rover control.",
    },
  ];

  int currentPage = 0;
  VoidCallback? onPageChanged;

  OnboardingController({this.onPageChanged}) {
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      if (onPageChanged != null) onPageChanged!();
    });
  }

  bool get isLastPage => currentPage == onboardingData.length - 1;

  void handleNext(BuildContext context) {
    if (isLastPage) {
      GoRouter.of(context).go(AppRouter.selectRole);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  
  void dispose() {
    if (pageController.hasClients) {
      pageController.dispose();
    }

  }

}
