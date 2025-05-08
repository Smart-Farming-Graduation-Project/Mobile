import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

Future<MultipartFile> uploadImageToApi(XFile imageFile) async {
  return MultipartFile.fromFile(imageFile.path,
      filename: imageFile.path.split('/').last.split('.').first,
      contentType: MediaType('image', imageFile.path.split('.').last));
}
