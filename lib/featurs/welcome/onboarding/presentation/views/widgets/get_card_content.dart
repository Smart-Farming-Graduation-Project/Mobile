import 'package:flutter/material.dart';

import '../../../../../../core/utils/theme/app_text_styles.dart';

class GetCardsContent extends StatelessWidget {
  final String image;
  final String cardContent;
  final String subtitle;

  const GetCardsContent({
    super.key,
    required this.image,
    required this.cardContent,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            scale: 0.4,
          ),
          const SizedBox(height: 30),
          Text(
            cardContent,
            style:
                AppTextStyles.textStyle24.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            subtitle,
            style: AppTextStyles.textStyle24.copyWith(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
