class CategoryModel {
  final String categoryName;
  final String image;
  final String categoryId;
  CategoryModel(
      {required this.categoryId,
      required this.categoryName,
      required this.image});
}

List<CategoryModel> categories = [
  CategoryModel(
      categoryName: "Meat",
      image: 'assets/images/home/meat.png',
      categoryId: '1'),
  CategoryModel(
      categoryName: "Vegetable",
      image: 'assets/images/home/Vegetable.png',
      categoryId: '2'),
  CategoryModel(
      categoryName: "Fruits",
      image: 'assets/images/home/Fruits.png',
      categoryId: '4'),
  CategoryModel(
      categoryName: "Grains",
      image: 'assets/images/home/Grains.png',
      categoryId: '5'),
  CategoryModel(
      categoryName: "Animal Feed",
      image: 'assets/images/home/Animal_Feed.png',
      categoryId: '24'),
  CategoryModel(
      categoryName: "Medeical_Plants",
      image: 'assets/images/home/Medicinal_Plants.png',
      categoryId: '25'),
  CategoryModel(
      categoryName: "Fertilizers",
      image: 'assets/images/home/Fertilizers.png',
      categoryId: '26'),
  CategoryModel(
      categoryName: "Rental Services",
      image: 'assets/images/home/Rental_Services.png',
      categoryId: '27'),
];
