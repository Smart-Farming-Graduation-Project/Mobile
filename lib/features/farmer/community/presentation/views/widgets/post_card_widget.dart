import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/features/farmer/community/models/post_model.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/create_post_cubit.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/vote_cubit.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/vote_state.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/user_posts_screen.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/post_actions_row.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/post_body.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/post_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../edit_post_screen.dart';
import 'post_details_screen.dart';

class PostCardWidget extends StatelessWidget {
  final PostModel post;

  const PostCardWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final String currentUserId =
        getIt<CacheHelper>().getData(key: "userId") ?? "";

    final bool isMyPost = post.userId == currentUserId;

    return BlocProvider(
      create: (_) => VoteCubit(
        initialVotes: post.voteCount,
        postId: post.id,
      ),
      child: BlocBuilder<VoteCubit, VoteState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PostDetailsScreen(post: post),
                ),
              );
            },
            child: Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header row (user info + actions)
                    Row(
                      children: [
                        Expanded(
                          child: PostHeader(
                            userName: post.userName,
                            userImageUrl: post.userImageUrl,
                            onTap: () {
                              if (!isMyPost) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => UserPostsScreen(
                                      userId: post.userId,
                                      userName: post.userName,
                                      userImageUrl: post.userImageUrl,
                                    ),
                                  ),
                                );

                              }
                            },
                          ),

                        ),
                        if (isMyPost)
                          IconButton(
                            icon: const Icon(Icons.more_vert),
                            onPressed: () {
                              final postCubit = context.read<PostCubit>();

                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) {
                                  return SafeArea(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: const Icon(Icons.edit),
                                          title: const Text('Edit'),
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => BlocProvider.value(
                                                  value: postCubit,
                                                  child: EditPostScreen(post: post),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.delete),
                                          title: const Text('Delete'),
                                          onTap: () {
                                            Navigator.pop(context);
                                            postCubit.deletePost(post.id);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Post title and content
                    PostBody(
                      title: post.title,
                      body: post.content,
                      maxLines: 5,
                    ),

                    const SizedBox(height: 14),

                    // Post actions row (votes, time, etc.)
                    PostActionsRow(
                      commentsCount: 0,
                      state: state,
                      timeAgo: post.updatedAt != null
                          ? 'Edited on ${DateFormat('dd/MM/yyyy').format(post.updatedAt!)}'
                          :DateFormat('dd/MM/yyyy').format(post.createdAt),
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
