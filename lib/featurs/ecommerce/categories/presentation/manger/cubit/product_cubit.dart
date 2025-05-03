import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/manger/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitialState());
  final api = getIt<DioConsumer>();
  Future<void> getProductDetails(String productId) async {
    emit(ProductLoadingState());
    try{
      final response = await api.get(EndPoints.getProductDetails(productId));
      ProductModel product = ProductModel.fromJson(response[ApiKeys.data]);
      emit(ProductLoadedState(product));
        } catch (e) {
      emit(ProductErrorState(e.toString()));

    }
  }
}