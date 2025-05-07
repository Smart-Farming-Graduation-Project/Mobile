import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.text2,
  });
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const HomeTitleText(text1: "Category"),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {},
          child: Text(text2, style: AppTextStyles.textStyle16GreenBold),
        )
      ]),
    );
  }
}

class HomeTitleText extends StatelessWidget {
  const HomeTitleText({
    super.key,
    required this.text1,
  });

  final String text1;

  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      style: AppTextStyles.textStyle20BlackBold,
    );
  }
}
