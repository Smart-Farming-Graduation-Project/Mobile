abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String,dynamic>? data,
  });

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String,dynamic>? data,
  });

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String,dynamic>? data,
  });

  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String,dynamic>? data,
  });
}
