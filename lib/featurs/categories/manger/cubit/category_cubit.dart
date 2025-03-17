import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<TextEditingController> {
  CategoryCubit() : super(TextEditingController());

  void filterCategories(String query) {
    state.text = query;
    emit(state);
  }
}
