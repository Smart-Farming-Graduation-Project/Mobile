import 'dart:io';

class Data {
  String? imageId;
  String? imageUrl;
  File? imageFile;

  Data({this.imageId, this.imageUrl, this.imageFile});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        imageId: json['imageId'] as String?,
        imageUrl: json['imageUrl'] as String?,
        imageFile: json['imageFile'] as File?,
      );

  Map<String, dynamic> toJson() => {
        'imageId': imageId,
        'imageUrl': imageUrl,
        'imageFile': imageFile,
      };
}
