class CategoryModel{
  final String categoryName;
  final String imageUrl;
  final String id;


  CategoryModel({required this.categoryName, required this.imageUrl,required this.id});
}

List<CategoryModel> categories = [
  CategoryModel(categoryName: "Meat", imageUrl: "assets/images/home/meat.png", id: "1"),
  CategoryModel(categoryName: "Vegetable", imageUrl: "assets/images/home/Vegetable.png", id: '2'),
  CategoryModel(categoryName: "Fruits", imageUrl: "assets/images/home/Fruits.png", id: '3'),
  CategoryModel(categoryName: "Grains", imageUrl: "assets/images/home/Grains.png", id: '4'),
  CategoryModel(categoryName: "Animal Feed", imageUrl: "assets/images/home/Animal Feed.png", id: '5'),
  CategoryModel(categoryName: "Medeical Plants", imageUrl: "assets/images/home/Medicinal Plants.png", id: '6'),
  CategoryModel(categoryName: "Fertilizers", imageUrl: "assets/images/home/Fertilizers.png", id: '7'),
  CategoryModel(categoryName: "Rental Services", imageUrl: "assets/images/home/Rental Services.png", id: '8'),

];