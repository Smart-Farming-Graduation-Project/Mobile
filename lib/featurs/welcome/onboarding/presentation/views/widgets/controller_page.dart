import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/routing/app_router.dart';

class OnboardingController {
  final PageController pageController = PageController();
  final List<Map<String, String>> onboardingData = [
    {
      "image": 'assets/images/onboarding/Animation - 1733267720718.gif',
      "cardContent": "Seamless Shopping, Fresh Finds, Anytime, Anywhere!",
      "subtitle": "Explore a world of fresh products and effortless shopping at your convenience.",
    },
    {
      "image": 'assets/images/onboarding/Animation - 1733268226361.gif',
      "cardContent": "Stay in Control, Wherever You Are!",
      "subtitle": "Monitor and control your rovers remotely through our app, ensuring your farm operates seamlessly 24/7.",
    },
    {
      "image": 'assets/images/onboarding/Animation - 1733271558252.gif',
      "cardContent": "Seamless Shopping, Fresh Finds, Anytime, Anywhere!",
      "subtitle": "Explore a world of fresh products and effortless shopping at your convenience.",
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
      GoRouter.of(context).go(AppRouter.home);
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
