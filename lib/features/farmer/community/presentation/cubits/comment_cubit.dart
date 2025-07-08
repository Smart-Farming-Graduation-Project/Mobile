import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/api/end_points.dart';
import '../../models/comment_model.dart';
import 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final DioConsumer api;

  CommentCubit() : api = getIt<DioConsumer>(), super(CommentInitial());

  Future<void> fetchComments(int postId) async {
    emit(CommentLoading());
    try {
      final response = await api.get(EndPoints.getCommentsByPostId(postId));
      final data = response['data'] as List;
      final comments = data.map((e) => CommentModel.fromJson(e)).toList();
      emit(CommentLoaded(comments));
    } on ServerException catch (e) {
      emit(CommentError(e.errorModel.errorMessage));
    }
  }

  Future<void> createComment({
    required int postId,
    required String content,
    int? parentCommentId,
  }) async {
    try {
      await api.post(
        EndPoints.createComment,
        data: {
          'postId': postId,
          'content': content,
          'parentCommentId': parentCommentId ?? 0,
        },
      );
      emit(CommentActionSuccess());
      await fetchComments(postId);
    } catch (e) {
      emit(const CommentError('Failed to add comment'));
    }
  }

  Future<void> updateComment({
    required int id,
    required String content,
    required int postId,
  }) async {
    try {
      await api.put(
        EndPoints.updateComment(id),
        data: {
          'id': id,
          'content': content,
        },
      );
      emit(CommentActionSuccess());
      await fetchComments(postId);
    } catch (e) {
      emit(const CommentError('Failed to update comment'));
    }
  }

  Future<void> deleteComment({
    required int id,
    required int postId,
  }) async {
    try {
      await api.delete(EndPoints.deleteComment(id));
      emit(CommentActionSuccess());
      await fetchComments(postId);
    } catch (e) {
      emit(const CommentError('Failed to delete comment'));
    }
  }
}
