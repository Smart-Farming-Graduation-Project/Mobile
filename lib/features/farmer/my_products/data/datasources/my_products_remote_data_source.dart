import 'dart:developer';

import 'package:crop_guard/core/api/api_consumer.dart';
import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import '../models/my_product_model.dart';

abstract class MyProductsRemoteDataSource {
  Future<List<MyProductModel>> getMyProducts(
      {int pageNumber = 1, int pageSize = 10});
  Future<bool> deleteMyProduct(int productId);
}

class MyProductsRemoteDataSourceImpl implements MyProductsRemoteDataSource {
  final ApiConsumer apiConsumer;

  MyProductsRemoteDataSourceImpl(
      {required this.apiConsumer, required DioConsumer api});

  @override
  Future<List<MyProductModel>> getMyProducts(
      {int pageNumber = 1, int pageSize = 10}) async {
    final response = await apiConsumer.get(
      '${EndPoints.getMyProducts}?PageNumber=$pageNumber&PageSize=$pageSize',
    );
    final List<dynamic> productsJson = response[ApiKeys.data] ?? [];
    return productsJson.map((json) => MyProductModel.fromJson(json)).toList().reversed.toList();
  }

  @override
  Future<bool> deleteMyProduct(int productId) async {
    log(EndPoints.deleteMyProduct(productId));
    await apiConsumer.delete(
      EndPoints.deleteMyProduct(productId),
    );

    return true;
  }

}
