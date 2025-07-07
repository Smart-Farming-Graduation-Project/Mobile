import 'package:crop_guard/features/farmer/community/presentation/cubits/create_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/create_post_cubit.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/post_card_widget.dart';

class UserPostsScreen extends StatelessWidget {
  final String userId;
  final String userName;

  const UserPostsScreen({
    super.key,
    required this.userId,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts by $userName"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocProvider.value(
        value: context.read<PostCubit>()..fetchPostsByUser(userId),
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostLoaded) {
              final posts = state.posts;
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: posts.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) => PostCardWidget(post: posts[index]),
              );
            } else if (state is PostError) {

              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
