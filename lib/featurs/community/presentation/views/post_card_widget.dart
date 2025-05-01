import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/community/manger/cubit/vote_cubit.dart';
import 'package:crop_guard/featurs/community/manger/cubit/vote_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/post_actions_row.dart';
import 'widgets/post_body.dart';
import 'widgets/post_header.dart';

class PostCardWidget extends StatelessWidget {
  final String title;
  final String body;
  final int initialVotes;
  final int commentsCount;
  final String subreddit;
  final String timeAgo;

  const PostCardWidget({
    super.key,
    required this.title,
    required this.body,
    required this.initialVotes,
    required this.commentsCount,
    required this.subreddit,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VoteCubit(initialVotes),
      child: BlocBuilder<VoteCubit, VoteState>(
        builder: (context, state) {
          return Card(
            color: AppColors.kPrimaryColor.withValues(alpha: 0.5),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.green.withValues(alpha: 0.1)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostHeader(subreddit: subreddit, ),
                  const SizedBox(height: 12),
                  PostBody(title: title, body: body),
                  const SizedBox(height: 16),
                  PostActionsRow(
                    commentsCount: commentsCount,
                    state: state, timeAgo: timeAgo,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
