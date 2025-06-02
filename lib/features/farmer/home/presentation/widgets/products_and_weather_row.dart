import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/features/farmer/home/presentation/widgets/my_products_card.dart';
import 'package:crop_guard/features/farmer/home/presentation/widgets/today_weather_card.dart';
import 'package:flutter/material.dart';

class ProductsAndWeatherRow extends StatelessWidget {
  const ProductsAndWeatherRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: MyProductsCard()),
        horizontalSpace(16),
        const Expanded(child: TodayWeatherCard()),
      ],
    );
  }
}
