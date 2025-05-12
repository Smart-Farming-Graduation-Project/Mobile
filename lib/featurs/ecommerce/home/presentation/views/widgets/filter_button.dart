import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../../../../core/theme/app_colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        text,
        style: AppTextStyles.font20BlackBold,
      ),
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Symbols.instant_mix,
            color: AppColors.kPrimaryColor,
            size: 28,
          ))
    ]);
  }
}
