import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/widgets/custom_button.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/post_body_input.dart';
import 'package:flutter/material.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/text_input.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: AppColors.kGreenColor,
        title: const Text("Create Post", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostTitleInput(),
            SizedBox(height: 16),
            PostBodyInput(),
            SizedBox(height: 24),
            CustomButton(
              text: 'Post',
            ),
          ],
        ),
      ),
    );
  }
}
