class ProductModel {
  final String name;
  final String image;
  final double price;
  bool isFavorite;

  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    this.isFavorite = false,
  });
}