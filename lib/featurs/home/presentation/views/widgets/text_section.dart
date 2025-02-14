
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/routing/app_router.dart';
import '../../../../../core/utils/theme/app_colors.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.text1, required this.text2,  });
final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold,fontFamily: 'Poppins'),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).go(AppRouter.categoryscreen);
            },
            child:  Text(
              text2 ,
              style: const TextStyle(color: AppColors.kPrimaryColor, fontSize: 20,fontWeight: FontWeight.bold),))
      ]
      ),
    );
  }
}
