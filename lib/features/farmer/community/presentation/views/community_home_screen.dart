import 'package:crop_guard/core/helper/build_app_bar.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/create_post_cubit.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/create_post_state.dart';
import 'package:crop_guard/features/farmer/community/presentation/widgets/comunnity_header.dart';
import 'package:crop_guard/features/farmer/community/presentation/widgets/post_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../widgets/PlaceholderPost.dart';

class CommunityHomeScreen extends StatelessWidget {
  const CommunityHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: buildAppBar(title: 'Community', context),
      body: BlocProvider(
        create: (_) => PostCubit()..fetchPosts(),
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return Skeletonizer(
                child: ListView.separated(
                  itemCount: 8,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    if (index == 0) return const SizedBox();
                    if (index == 1) return const ComunnityHeader();
                    return PostCardWidget(
                      post: PlaceholderPost(),
                    );
                  },
                ),
              );
            } else if (state is PostLoaded) {
              final posts = state.posts;
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                itemCount: posts.length + 2,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  if (index == 0) return const SizedBox();
                  if (index == 1) return const ComunnityHeader();
                  final post = posts[index - 2];
                  return PostCardWidget(post: post);
                },
              );
            } else if (state is PostError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
