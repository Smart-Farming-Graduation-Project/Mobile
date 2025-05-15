import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/farmer/community/post_cubit/create_post_cubit.dart';
import 'package:crop_guard/featurs/farmer/community/post_cubit/create_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'widgets/comunnity_header.dart';
import 'post_card_widget.dart';

class CommunityHomeScreen extends StatelessWidget {
  const CommunityHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],

      appBar: AppBar(
        elevation: 1,
        title: Image.asset(
          'assets/images/community/cropGuardText.png',
          scale: 2,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.kPrimaryColor),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color:AppColors.kPrimaryColor),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: AppColors.kPrimaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => PostCubit()..fetchPosts(),
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return Center(child: Skeletonizer(
                child: Expanded(
                child: ListView.separated(
    itemCount:  8,
    separatorBuilder: (_, __) => const SizedBox(height: 12),
    itemBuilder: (context, index) {
    if (index == 0) return const SizedBox();
    if (index == 1) return const ComunnityHeader();
            return const PostCardWidget(
                    title: 'Loading...',
                    body: 'Loading...',
                    initialVotes: 0,
                    commentsCount: 0,
                    subreddit: 'Loading...',
                    timeAgo: 'Loading...',
    );}),
                )));
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
                  return PostCardWidget(
                    title: post.title,
                    body: post.content,
                    initialVotes: post.voteCount,
                    commentsCount: 0,
                    subreddit: post.userId,
                    timeAgo: post.createdAt.toString().substring(0, 10),
                  );
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
