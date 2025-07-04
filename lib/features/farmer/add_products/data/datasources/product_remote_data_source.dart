import 'dart:developer';

import 'package:crop_guard/core/api/api_consumer.dart';
import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:dio/dio.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<String> addProduct(ProductModel product);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiConsumer api;
  ProductRemoteDataSourceImpl({required this.api});

  @override
  Future<String> addProduct(ProductModel product) async {
    // Create a map for form data
    final Map<String, dynamic> formDataMap = {};

    // Add images to form data map
    for (int i = 0; i < product.images.length; i++) {
      log(product.images[i].path);
      formDataMap['Images'] = await MultipartFile.fromFile(
        product.images[i].path,
        filename: 'product_image_$i.jpg',
        contentType: DioMediaType('image', 'jpeg'),
      );
    }

    // Create query parameters for product data
    final queryParameters = {
      'Name': product.name,
      'Description': product.description,
      'Price': product.price.toString(),
      // 'Quantity': product.quantity.toString(),
      'CategoryName': product.category,
      'Availability': product.isAvailable ? 'Sale' : 'NotAvailable',
    };

    final response = await api.post(
      EndPoints.addProduct,
      data: formDataMap,
      queryParameters: queryParameters,
      isFormData: true,
    );

    return response[ApiKeys.data];
  }
}
