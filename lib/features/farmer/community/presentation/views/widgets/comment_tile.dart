import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/features/farmer/community/models/comment_model.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/comment_cubit.dart';

class CommentTile extends StatelessWidget {
  final CommentModel comment;
  final int postId;
  final void Function()? onReply;

  const CommentTile({
    super.key,
    required this.comment,
    required this.postId,
    this.onReply,
  });

  @override
  Widget build(BuildContext context) {
    final String currentUserId = getIt<CacheHelper>().getData(key: "userId") ??
        "";
    final bool isMyComment = comment.userId == currentUserId;
    final bool isReply = comment.parentCommentId != null &&
        comment.parentCommentId != 0;

    return Container(
      margin: EdgeInsets.only(
        left: isReply ? 32 : 16,
        right: 16,
        bottom: 10,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FBF9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: comment.userImageUrl.isNotEmpty
                    ? NetworkImage(comment.userImageUrl)
                    : null,
                backgroundColor: const Color(0xFFC8E6C9),
                child: comment.userImageUrl.isEmpty
                    ? const Icon(Icons.person, size: 18, color: Colors.black)
                    : null,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  comment.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              if (isMyComment)
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      // edit
                    } else if (value == 'delete') {
                      context.read<CommentCubit>().deleteComment(
                        id: comment.id,
                        postId: postId,
                      );
                    }
                  },
                  itemBuilder: (context) =>
                  const [
                    PopupMenuItem(value: 'edit', child: Text('Edit')),
                    PopupMenuItem(value: 'delete', child: Text('Delete')),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            comment.content,
            style: const TextStyle(fontSize: 14, color: Colors.black87,fontWeight: FontWeight.bold),),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onReply,
              child: const Text(
                "Reply",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF388E3C),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );}}