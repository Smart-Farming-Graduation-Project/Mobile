class SellerModel {
  final String name;
  final String image;
  final String description;

  const SellerModel({
    required this.name,
    required this.image,
    required this.description,
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) {
    return SellerModel(
      name: json['name'],
      image: json['image'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
    };
  }
}
