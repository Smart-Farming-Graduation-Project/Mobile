import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_animation/onboarding_animation.dart';

import '../../../../../core/routes/app_router.dart';

import '../../../../../core/theme/app_text_styles.dart';
import 'widgets/controller_page.dart';
import 'widgets/get_card_content.dart';
import 'widgets/next_button.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final OnboardingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OnboardingController(onPageChanged: () {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(130),
            Expanded(
              child: OnBoardingAnimation(
                controller: _controller.pageController,
                pages: List.generate(
                  _controller.onboardingData.length,
                  (index) => GetCardsContent(
                    image: _controller.onboardingData[index]["image"]!,
                    cardContent: _controller.onboardingData[index]
                        ["cardContent"]!,
                    subtitle: _controller.onboardingData[index]["subtitle"]!,
                  ),
                ),
                indicatorDotHeight: 8,
                indicatorDotWidth: 8,
                indicatorActiveDotColor: Colors.green,
                indicatorType: IndicatorType.jumpingDots,
                indicatorPosition: IndicatorPosition.bottomCenter,
                indicatorSwapType: SwapType.normal,
              ),
            ),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go(AppRouter.signIn);
                      getIt<CacheHelper>().saveData(
                        key: "isOnboardingVisited",
                        value: true,
                      );
                    },
                    child: Text('SKIP', style: AppTextStyles.font20BlackBold),
                  ),
                  NextButton(
                    isLastPage: _controller.isLastPage,
                    onPressed: () => _controller.handleNext(context),
                  ),
                ],
              ),
            ),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }
}
