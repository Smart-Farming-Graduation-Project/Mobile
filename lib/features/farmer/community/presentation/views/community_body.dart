import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/comunnity_header.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/post_card_widget.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/placeholder_post.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/create_post_cubit.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/create_post_state.dart';

class CommunityBody extends StatelessWidget {
  final int index;
  final PostCubit postCubit;

  const CommunityBody({
    super.key,
    required this.index,
    required this.postCubit,
  });

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return BlocBuilder<PostCubit, PostState>(
          bloc: postCubit,
          builder: (context, state) {
            if (state is PostLoading) {
              return Skeletonizer(
                child: ListView.separated(
                  itemCount: 8,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    if (index == 0) return const SizedBox();
                    if (index == 1) return const CommunityHeader();
                    return PostCardWidget(post: PlaceholderPost());
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
                  if (index == 1) return const CommunityHeader();
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
        );
      case 1:
        return const Center(child: Text(" Profile Page"));
      default:
        return const SizedBox();
    }
  }
}
