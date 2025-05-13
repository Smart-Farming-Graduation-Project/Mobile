import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    title: Text(
      title,
      style: AppTextStyles.font20BlackBold,
    ),
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
      onPressed: () {
        GoRouter.of(context).pop();
      },
    ),
  );
}
