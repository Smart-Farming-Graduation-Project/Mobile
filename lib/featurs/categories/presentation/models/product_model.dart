class ProductModel {
  final String name;
  final String category;
  final String image;
  final String price;
  bool isFavorite;

  ProductModel( {
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    this.isFavorite = false,
  });
}
List<ProductModel> products = [
  ProductModel(
      image: 'assets/images/home/Broccoli.png',
      name: 'Broccoli',
      price: '\$18.00',
      category: 'Vegetable',
    ),

  ProductModel(
      image: 'assets/images/home/Avocado.png',
      name: 'Avocado',
      price: '\$18.00',
      category: 'Fruits',),
  ProductModel(
    image: 'assets/images/home/Broccoli.png',
    name: 'Broccoli',
    price: '\$18.00',
    category: 'Vegetable',
  ),

  ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Avocado',
    price: '\$18.00',
    category: 'Fruits',),
  ProductModel(
    image: 'assets/images/home/Broccoli.png',
    name: 'Broccoli',
    price: '\$18.00',
    category: 'Vegetable',
  ),

  ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Avocado',
    price: '\$18.00',
    category: 'Fruits',),
  ProductModel(
    image: 'assets/images/home/Broccoli.png',
    name: 'Broccoli',
    price: '\$18.00',
    category: 'Vegetable',
  ),

  ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Avocado',
    price: '\$18.00',
    category: 'Fruit',),
  ProductModel(
    image: 'assets/images/home/Broccoli.png',
    name: 'Broccoli',
    price: '\$18.00',
    category: 'Vegetable',
  ),

  ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Avocado',
    price: '\$18.00',
    category: 'Fruits',),
  ProductModel(
    image: 'assets/images/home/Broccoli.png',
    name: 'Broccoli',
    price: '\$18.00',
    category: 'Vegetable',
  ),

  ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Avocado',
    price: '\$18.00',
    category: 'Fruits',),


];
