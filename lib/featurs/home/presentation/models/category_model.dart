class CategoryModel{
  final String categoryName;
  final String imageUrl;

  CategoryModel({required this.categoryName, required this.imageUrl});
}

List<CategoryModel> categories = [
  CategoryModel(categoryName: "Meat", imageUrl: "assets/images/home/meat.png"),
  CategoryModel(categoryName: "Vegetable", imageUrl: "assets/images/home/Vegetable.png"),
  CategoryModel(categoryName: "Fruits", imageUrl: "assets/images/home/Fruits.png"),
  CategoryModel(categoryName: "Grains", imageUrl: "assets/images/home/Grains.png"),
  CategoryModel(categoryName: "Animal Feed", imageUrl: "assets/images/home/Animal Feed.png"),
  CategoryModel(categoryName: "Medicinal Plants", imageUrl: "assets/images/home/Medicinal Plants.png"),
  CategoryModel(categoryName: "Fertilizers", imageUrl: "assets/images/home/Fertilizers.png"),
  CategoryModel(categoryName: "Rental Services", imageUrl: "assets/images/home/Rental Services.png"),

];