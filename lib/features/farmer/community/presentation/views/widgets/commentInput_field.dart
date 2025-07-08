import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/comment_cubit.dart';

class CommentInputField extends StatefulWidget {
  final int postId;
  final int? parentCommentId;
  final VoidCallback? onCommentSent;

  const CommentInputField({
    super.key,
    required this.postId,
    this.parentCommentId,
    this.onCommentSent,
  });

  @override
  State<CommentInputField> createState() => _CommentInputFieldState();
}

class _CommentInputFieldState extends State<CommentInputField> {
  final TextEditingController _controller = TextEditingController();
  bool isSending = false;

  Future<void> _sendComment() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() => isSending = true);

    await context.read<CommentCubit>().createComment(
      postId: widget.postId,
      content: text,
      parentCommentId: widget.parentCommentId,
    );

    setState(() => isSending = false);
    _controller.clear();
    widget.onCommentSent?.call();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Expanded(
        child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withValues(alpha: 0.5),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: "Write a comment...",
                  border: InputBorder.none,
                ),
              ),
            ),
            isSending
                ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
                : IconButton(
              icon: const Icon(Icons.send, color: Color(0xFF2E7D32)),
              onPressed: _sendComment,
            ),
          ],
        ),
      ),

    )])));
  }
}