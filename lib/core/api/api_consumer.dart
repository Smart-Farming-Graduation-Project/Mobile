abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });

  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });
}
