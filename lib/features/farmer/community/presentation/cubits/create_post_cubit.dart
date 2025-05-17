
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crop_guard/features/farmer/community/data/models/post_model.dart';
import 'create_post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  final Dio _dio = Dio();

  Future<void> fetchPosts() async {
    emit(PostLoading());
    try {
      final response = await _dio.get('https://crop-pilot-api.azurewebsites.net/api/Posts/GetPosts');
      final postsData = response.data['data'] as List;
      final posts = postsData.map((json) => PostModel.fromJson(json)).toList();
      emit(PostLoaded(posts));
    } catch (e) {

      emit(PostError('Failed to load posts'));
      log(state.runtimeType.toString());
      log(e.toString());

    }
  }
}
