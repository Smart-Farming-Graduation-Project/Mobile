import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/community_cubit.dart';
import '../bloc/community_state.dart';
import '../widgets/post_widget.dart';

class CommunityHomeScreen extends StatelessWidget {
  const CommunityHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Navigate to create post screen
            },
          ),
        ],
      ),
      body: BlocBuilder<CommunityCubit, CommunityState>(
        builder: (context, state) {
          if (state.status == CommunityStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == CommunityStatus.error) {
            return Center(
                child: Text(state.errorMessage ?? 'An error occurred'));
          }

          if (state.status == CommunityStatus.loaded) {
            if (state.posts.isEmpty) {
              return const Center(
                  child: Text('No posts yet. Be the first to post!'));
            }

            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return PostWidget(
                  post: post,
                  onVote: (voteChange) => context
                      .read<CommunityCubit>()
                      .votePost(post.id, voteChange),
                  onDelete: () =>
                      context.read<CommunityCubit>().deletePost(post.id),
                );
              },
            );
          }

          return const Center(child: Text('Loading posts...'));
        },
      ),
    );
  }
}
