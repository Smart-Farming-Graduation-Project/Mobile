class Data {
  String? imageId;
  String? imageUrl;

  Data({this.imageId, this.imageUrl});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        imageId: json['imageId'] as String?,
        imageUrl: json['imageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'imageId': imageId,
        'imageUrl': imageUrl,
      };
}
