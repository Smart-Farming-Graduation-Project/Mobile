import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/farmer/community/models/post_model.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/vote_cubit.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/vote_state.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/post_actions_row.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/post_body.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/post_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PostCardWidget extends StatelessWidget {
  final PostModel post;

  const PostCardWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VoteCubit(post.voteCount),
      child: BlocBuilder<VoteCubit, VoteState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
            },
            child: Card(
              color: AppColors.kCardWhite,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.green.withValues(alpha:  0.5)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostHeader(subreddit: post.userId),
                    const SizedBox(height: 12),
                    PostBody(
                      title: post.title,
                      body: post.content,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 16),
                    PostActionsRow(
                      commentsCount: 0,
                      state: state,
                      timeAgo: DateFormat('dd/MM/yyyy').format(post.createdAt),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
