import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/featurs/ecommerce/home/presentation/views/widgets/home_title_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const HomeTitleText(title: "Category"),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.category);
          },
          child: Text(text, style: AppTextStyles.font16GreenBold),
        )
      ]),
    );
  }
}
