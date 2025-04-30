import 'package:flutter/material.dart';
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
            icon: const Icon(Icons.search, color: Colors.green),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.green),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        itemCount: 14,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == 0) return const SizedBox();
          if (index == 1) return const ComunnityHeader();
          return const PostCardWidget(
            title: "Title",
            body: "This is the body of the post.",
            initialVotes: 6,
            commentsCount: 50,
            subreddit: "noha",
          );
        },
      ),
    );
  }
}
