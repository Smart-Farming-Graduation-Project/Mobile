import 'package:flutter/material.dart';

class SplashScreenController {
  final AnimationController animationController;
  late final Animation<double> imageAnimation;

  SplashScreenController({
    required TickerProvider vsync,
    required VoidCallback onCompleted,
  }) : animationController = AnimationController(
    vsync: vsync,
    duration: const Duration(seconds: 3),
  ) {
    imageAnimation = _createAnimation(0.0, 0.5, Curves.easeOutBack, -100.0, 0.0);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) onCompleted();
    });
  }

  void startAnimation() => animationController.forward();

  Animation<double> _createAnimation(
      double start, double end, Curve curve, double from, double to) {
    return Tween<double>(begin: from, end: to).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(start, end, curve: curve),
      ),
    );
  }

  void dispose() => animationController.dispose();
}
