import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          GoRouter.of(context).push(AppRouter.popularProducts);
        },
        child: Text("See All", style: AppTextStyles.font16GreenBold),
      )
    ]);
  }
}
