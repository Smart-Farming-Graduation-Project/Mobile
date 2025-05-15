import 'package:crop_guard/featurs/farmer/community/manger/cubit/vote_cubit.dart';
import 'package:crop_guard/featurs/farmer/community/manger/cubit/vote_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostActionsRow extends StatelessWidget {
  final int commentsCount;
  final VoteState state;
  final String timeAgo;
  const PostActionsRow({
    super.key,
    required this.commentsCount,
    required this.state,
    required this.timeAgo,

  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VoteCubit>();

    return Row(
      children: [
        GestureDetector(
          onTap: cubit.upvote,
          child: Icon(Icons.arrow_upward_sharp,
              color: state.voteStatus == VoteStatus.upvoted
                  ? Colors.lightGreenAccent
                  : Colors.white,
              size: 24),
        ),
        const SizedBox(width: 4),
        Text('${state.votes}',
            style: const TextStyle(color: Colors.white)),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: cubit.downvote,
          child: Icon(Icons.arrow_downward_sharp,
              color: state.voteStatus == VoteStatus.downvoted
                  ? Colors.red
                  : Colors.white,
              size: 24),
        ),
        const SizedBox(width: 16),
        const Icon(Icons.comment_outlined, color: Colors.white, size: 24),
        const SizedBox(width: 6),
        Text("$commentsCount",
            style: const TextStyle(color: Colors.white)),
        const SizedBox(width: 10),
        const Icon(Icons.share_sharp, color: Colors.white, size: 24),
        const SizedBox(width: 3),
        const Text("Share", style: TextStyle(color: Colors.white, fontSize: 12)),
        const Spacer(),
        Text(
          ' $timeAgo',
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),

      ],
    );
  }
}
