import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/widgets/user_image.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/create_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityHeader extends StatelessWidget {
  final PostCubit? postCubit;

  const CommunityHeader({super.key, this.postCubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
          children: [
          const UserImage(radius: 24),
      const SizedBox(width: 10),
      Expanded(
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.createpost,
              extra: postCubit,
            );
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
                children: [
                const Icon(Icons.add, color: Colors.green, size: 20),
            const SizedBox(width: 10),
            Text(
              'Share what\'s on your mind...',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
            ),
          ),
          ],
        ),
      ),
    ),
    )
    ],
    ),
    );
  }
}