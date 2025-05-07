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
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          Column(
            children: [
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
            ],
          ),
          Positioned(
            bottom: 65,
            left: screenWidth * 0.1,
            child: GestureDetector(
              child: Text('SKIP', style: AppTextStyles.textStyle20BlackBold),
              onTap: () {
                GoRouter.of(context).go(AppRouter.signIn);
              },
            ),
          ),
          Positioned(
            bottom: 40,
            left: (screenWidth / 2) - 5,
            child: NextButton(
              isLastPage: _controller.isLastPage,
              onPressed: () => _controller.handleNext(context),
            ),
          ),
        ],
      ),
    );
  }
}
