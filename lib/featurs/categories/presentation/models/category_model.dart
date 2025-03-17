class CategoryModel {
  final String categoryName;
  final String image;
  CategoryModel({required this.categoryName, required this.image});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryName: json['categoryName'],
      image: json['image'],
    );
  }
}

List<CategoryModel> categories = [
  CategoryModel(categoryName: "Meat", image: 'assets/images/home/meat.png'),
  CategoryModel(
      categoryName: "Vegetable", image: 'assets/images/home/Vegetable.png'),
  CategoryModel(categoryName: "Fruits", image: 'assets/images/home/Fruits.png'),
  CategoryModel(categoryName: "Grains", image: 'assets/images/home/Grains.png'),
  CategoryModel(
      categoryName: "Animal Feed", image: 'assets/images/home/Animal Feed.png'),
  CategoryModel(
      categoryName: "Medeical Plants",
      image: 'assets/images/home/Medicinal Plants.png'),
  CategoryModel(
      categoryName: "Fertilizers", image: 'assets/images/home/Fertilizers.png'),
  CategoryModel(
      categoryName: "Rental Services",
      image: 'assets/images/home/Rental Services.png'),
];
