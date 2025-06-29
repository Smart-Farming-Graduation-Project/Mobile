import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/services/service_locator.dart';

Future<Map<String, dynamic>> addProductToCart(int productId) async {
  final api = getIt<DioConsumer>();
  final response = await api.post(EndPoints.addToCart(productId),
      queryParameters: {ApiKeys.quantity: 1});
  return response;
}
