import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crop_guard/features/farmer/community/models/post_model.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/post_card_widget.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/comment_cubit.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/comment_state.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/widgets/comment_tile.dart';
import 'commentInput_field.dart';

class PostDetailsScreen extends StatefulWidget {
  final PostModel post;

  const PostDetailsScreen({super.key, required this.post});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  int? _replyToCommentId;
  String? _replyToUserName;

  void _setReplyTarget(int? commentId, String? userName) {
    setState(() {
      _replyToCommentId = commentId;
      _replyToUserName = userName;
    });
  }

  void _clearReplyTarget() {
    setState(() {
      _replyToCommentId = null;
      _replyToUserName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommentCubit()..fetchComments(widget.post.id),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFF1F5F2),
          appBar: AppBar(
            title: const Text(
              "Post",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: const Color(0xFFF1F5F2),


            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: PostCardWidget(post: widget.post),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    SizedBox(height: 10),
                    Icon(Icons.comment, size: 20, color: Color(0xFF2E7D32)),
                    SizedBox(width: 6),
                    Text(
                      "Comments",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),

                  ],
                ),
              ),

              Expanded(
                child: BlocBuilder<CommentCubit, CommentState>(
                  builder: (context, state) {
                    if (state is CommentLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CommentLoaded) {
                      final all = state.comments;
                      final parents = all
                          .where((c) =>
                      c.parentCommentId == null ||
                          c.parentCommentId == 0)
                          .toList();
                      final replies = all
                          .where((c) =>
                      c.parentCommentId != null &&
                          c.parentCommentId != 0)
                          .toList();

                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        itemCount: parents.length,
                        itemBuilder: (context, index) {
                          final parent = parents[index];
                          final parentReplies = replies
                              .where((r) => r.parentCommentId == parent.id)
                              .toList();

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommentTile(
                                comment: parent,
                                postId: widget.post.id,
                                onReply: () => _setReplyTarget(parent.id, parent.userName),
                              ),
                              ...parentReplies.map((reply) => Padding(
                                padding: const EdgeInsets.only(left: 32.0),
                                child: CommentTile(
                                  comment: reply,
                                  postId: widget.post.id,
                                  onReply: () => _setReplyTarget(reply.id, reply.userName),
                                ),
                              )),
                              const SizedBox(height: 6),
                            ],
                          );
                        },
                      );
                    } else if (state is CommentError) {
                      return Center(child: Text(state.message));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
              if (_replyToCommentId != null && _replyToUserName != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Replying to $_replyToUserName',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 20),
                        onPressed: _clearReplyTarget,
                      ),
                    ],
                  ),
                ),
              CommentInputField(
                postId: widget.post.id,
                parentCommentId: _replyToCommentId,
                onCommentSent: _clearReplyTarget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
