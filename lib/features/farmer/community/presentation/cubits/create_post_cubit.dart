import 'dart:developer';
import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/farmer/community/models/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  final api = getIt<DioConsumer>();
  final List<PostModel> posts = [];
  Future<void> fetchAllPosts() async {
    emit(PostLoading());
    try {
      final response = await api.get(EndPoints.getAllPosts);
      final postsData = response[ApiKeys.data] as List;

      final fetchedPosts = postsData
          .map((json) => PostModel.fromJson(json))
          .toList()
          .reversed
          .toList();

      posts.clear();
      posts.addAll(fetchedPosts);

      emit(PostLoaded(posts));
    } on ServerException catch (e) {
      emit(PostError(e.errorModel.errorMessage));
    }
  }

  Future<void> fetchPostById(int id) async {
    emit(PostLoading());
    try {
      final response = await api.get(EndPoints.getPostById(id));
      final post = PostModel.fromJson(response[ApiKeys.data]);
      emit(PostLoaded([post]));
    } on ServerException catch (e) {
      emit(PostError(e.errorModel.errorMessage));
    }
  }

  Future<void> fetchPostsByUser(String userId) async {
    emit(PostLoading());
    try {
      final response = await api.get(EndPoints.getPostsByUser(userId));
      final postsData = response[ApiKeys.data] as List;
      final userPosts = postsData.map((json) => PostModel.fromJson(json)).toList();
      emit(PostLoaded(userPosts));
    } on ServerException catch (e) {
      emit(PostError(e.errorModel.errorMessage));
    }
  }

  Future<void> createPost({
    required String title,
    required String content,
    required int sharedPostId,
  }) async {
    try {
      await api.post(
        EndPoints.createPost,
        data: {
          "title": title,
          "content": content,
          "sharedPostId": sharedPostId,
        },
      );
      log("Post created successfully");
    } on ServerException catch (e) {
      throw Exception("Create Post failed: ${e.errorModel.errorMessage}");
    } catch (e) {
      throw Exception("Create Post failed: ${e.toString()}");
    }
  }

  Future<void> updatePost({
    required int id,
    required String title,
    required String content,
    int sharedPostId = 0,
  }) async {
    emit(PostLoading());
    try {
      await api.put(
        EndPoints.updatePost(id),
        data: {
          "id": id,
          "title": title,
          "content": content,
          "sharedPostId": sharedPostId,
        },
      );
      await fetchAllPosts();
    } on ServerException catch (e) {
      emit(PostError(e.errorModel.errorMessage));
    }
  }

  Future<void> deletePost(int id) async {
    emit(PostLoading());
    try {
      await api.delete(EndPoints.deletePost(id));
      await fetchAllPosts();
    } on ServerException catch (e) {
      emit(PostError(e.errorModel.errorMessage));
    }
  }
}
