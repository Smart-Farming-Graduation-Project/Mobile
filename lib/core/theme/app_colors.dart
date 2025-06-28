import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color kGreenColor = Color(0xFF27A162);
  static const Color kWhiteColor = Color(0xFFF4F4F4);
  static const Color kGrayColor = Color(0xFF9D9D9D);
  static const Color kBlackColor = Color(0xFF111111);
  static const Color kOrangeColor = Color(0xFFEDA932);
  static const Color kPrimaryColor = Color(0xFF06AE57);
  static const Color kDangerColor = Color(0xFFD32F2F);
  static const Color kYellowColor = Color(0xFFecc514);
  static const Color kLightBlackColor = Color(0xFFe8ece4);

  static const Color kCardWhite = Color(0xFFFFFFFF);
  static const Color kTextPrimary = Color(0xFF212121);
  static const Color kTextSecondary = Color(0xFF757575);
  static const Color kShadowColor = Color(0x0D000000); // شفافية 5%
  static const Color kBackgroundGray = Color(0xFFF5F5F5);

  // Sensor Data Card Colors
  static const Color kSensorCardGradientStart = Color(0xFFFFFFFF);
  static const Color kSensorCardGradientEnd = Color(0xFFF8F8F8);
  static const Color kSensorCardShadow = Color(0x14000000); // 8% opacity
  static const Color kSensorCardBorderGreen = Color(0x3327A162); // 20% opacity
  static const Color kSensorCardBorderRed = Color(0x33D32F2F); // 20% opacity
  static const Color kSensorCardBackgroundGreen =
      Color(0x1A27A162); // 10% opacity
  static const Color kSensorCardBackgroundRed =
      Color(0x1AD32F2F); // 10% opacity
  static const Color kSensorCardSafeRangeBackground = Color(0xFFF5F5F5);
  static const Color kSensorCardInfoIcon = Color(0xFF757575);
}
