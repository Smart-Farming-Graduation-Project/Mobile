class CategoryModel {
  final String categoryDescription;
  final String categoryName;
  final String image;
  final String categoryId;
  CategoryModel(
      {required this.categoryId,
      required this.categoryName,
      required this.image,
      required this.categoryDescription});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['categoryId'].toString(),
      categoryName: json['categoryName'] as String,
      image: json['categoryImage'] as String,
      categoryDescription: json['categoryDescription'] as String,
    );
  }
}
