import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/base_card.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/temperature_display.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/weather_details.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/weather_header.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WeatherHeader(),
          verticalSpace(7),
          const TemperatureDisplay(),
          verticalSpace(3),
          const WeatherDetails(),
        ],
      ),
    );
  }
}
