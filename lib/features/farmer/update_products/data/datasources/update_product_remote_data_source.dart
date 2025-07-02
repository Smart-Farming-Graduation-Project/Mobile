import 'dart:developer';

import 'package:crop_guard/core/api/api_consumer.dart';
import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:dio/dio.dart';
import '../models/update_product_model.dart';

abstract class UpdateProductRemoteDataSource {
  Future<String> updateProduct(UpdateProductModel product);
}

class UpdateProductRemoteDataSourceImpl
    implements UpdateProductRemoteDataSource {
  final ApiConsumer api;
  UpdateProductRemoteDataSourceImpl({required this.api});

  @override
  Future<String> updateProduct(UpdateProductModel product) async {
    // Create a map for form data
    final Map<String, dynamic> formDataMap = {};

    // Add only new images to form data map
    final newImages = product.newImages;

    // Check if we have any images (new or existing)
    final existingImages = product.existingImageUrls;
    if (newImages.isEmpty && existingImages.isEmpty) {
      throw Exception('Images: At least one image is required');
    }

    // Add new images to form data map with proper indexing
    if (newImages.isNotEmpty) {
      for (int i = 0; i < newImages.length; i++) {
        log(newImages[i].path);
        formDataMap['Images'] = await MultipartFile.fromFile(
          newImages[i].path,
          filename: 'product_image_$i.jpg',
          contentType: DioMediaType('image', 'jpeg'),
        );
      }
    }

    log("product id: ${product.id}");
    // Create query parameters for product data, including id
    final queryParameters = {
      'Id': product.id,
      'Name': product.name,
      'Description': product.description,
      'Price': product.price.toString(),
      'CategoryName': product.category,
      'Availability': product.isAvailable ? 'Sale' : 'Lease',
    };

    final response = await api.put(
      EndPoints.updateProduct,
      data: formDataMap,
      queryParameters: queryParameters,
      isFormData: true,
    );

    return response[ApiKeys.data];
  }
}
