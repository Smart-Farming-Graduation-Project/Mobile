import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/create_post_cubit.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/create_post_state.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/post_card_widget.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = getIt<CacheHelper>().getData(key: "userId") ?? "";
    final userName = getIt<CacheHelper>().getData(key: "userName") ?? "Me";
    final userImageUrl = getIt<CacheHelper>().getData(key: "userImage") ?? "";

    return BlocProvider(
      create: (_) => PostCubit()..fetchPostsByUser(userId),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFF6F7F9),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    children: [

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Farmer • CropGuard",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(userImageUrl),
                        backgroundColor: Colors.grey[300],
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: BlocBuilder<PostCubit, PostState>(
                  builder: (context, state) {
                    if (state is PostLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PostLoaded) {
                      if (state.posts.isEmpty) {
                        return const Center(
                          child: Text('You have not posted anything yet.'),
                        );
                      }
                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        itemCount: state.posts.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final post = state.posts[index];
                          return PostCardWidget(post: post);
                        },
                      );
                    } else if (state is PostError) {
                      return Center(child: Text('Error: ${state.message}'));
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
