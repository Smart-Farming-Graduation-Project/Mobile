import 'package:crop_guard/core/media_methode/method.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PostToolbar extends StatelessWidget {
  const PostToolbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.link, color: AppColors.kPrimaryColor),
          onPressed: () {},
          tooltip: 'Insert Link',
        ),
        IconButton(
          icon: const Icon(Icons.image, color: AppColors.kPrimaryColor),
          onPressed: () => showMediaOptions(context, isImage: true),
          tooltip: 'Add Image',
        ),
        IconButton(
          icon: const Icon(Icons.videocam, color: AppColors.kPrimaryColor),
          onPressed: () => showMediaOptions(context, isImage: false),
          tooltip: 'Add Video',
        ),
      ],
    );
  }
}
