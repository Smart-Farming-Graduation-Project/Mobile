class  SellerModel {
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

const List<SellerModel> sellers = [
  SellerModel(
    name: "Sara",
    image: "assets/images/home/profile.png",
    description: "Specialized in growing high-quality organic vegetables.",
  ),
  SellerModel(
    name: "Mena",
    image: "assets/images/home/profile.png",
    description: "Providing the freshest fruits directly from our farms.",
  ),
  SellerModel(
    name: "Naira",
    image: "assets/images/home/profile.png",
    description: "100% natural production of grains and legumes.",
  ),
  SellerModel(
    name: "Noha",
    image: "assets/images/home/profile.png",
    description: "Experts in growing roses and aromatic plants.",
  ),
  SellerModel(
    name: "Malak",
    image: "assets/images/home/profile.png",
    description: "Supplying the finest dates and fresh nuts.",
  ),
  SellerModel(
    name: "Noha",
    image: "assets/images/home/profile.png",
    description: "Experts in growing roses and aromatic plants.",
  ),SellerModel(
    name: "Noha",
    image: "assets/images/home/profile.png",
    description: "Experts in growing roses and aromatic plants.",
  ),SellerModel(
    name: "Noha",
    image: "assets/images/home/profile.png",
    description: "Experts in growing roses and aromatic plants.",
  ),SellerModel(
    name: "Noha",
    image: "assets/images/home/profile.png",
    description: "Experts in growing roses and aromatic plants.",
  ),SellerModel(
    name: "Noha",
    image: "assets/images/home/profile.png",
    description: "Experts in growing roses and aromatic plants.",
  ),SellerModel(
    name: "Noha",
    image: "assets/images/home/profile.png",
    description: "Experts in growing roses and aromatic plants.",
  ),
];
class ProductModel {
  final int id;
  final String name;
  final String category;
  final String price;
  final String image;
  final String description;
  final SellerModel seller;
  final double rating;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.description,
    required this.seller,
    this.rating = 4.5,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: json['price'].toString(),
      image: json['image'],
      description: json['description'],
      seller: SellerModel.fromJson(json['seller']),
      rating: (json['rating'] as num?)?.toDouble() ?? 4.5,
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'image': image,
      'description': description,
      'seller': seller.toJson(),
      'rating': rating,
      'isFavorite': isFavorite,
    };
  }
}


final List<ProductModel> products = [
  ProductModel(
    image: 'assets/images/home/Broccoli.png',
    name: 'Broccoli',
    price: '18.00',
    category: 'Vegetable',

    id: 1,
    description: 'Fresh organic broccoli directly from the farm.',
    seller: sellers[0],
  ),
  ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Avocado',
    price: '25.00',

    category: 'Fruits',
    id: 2,
    description: 'Organic avocado with rich taste and high quality.',
    seller: sellers[1],
  ),
  ProductModel(
    image: 'assets/images/home/Broccoli.png',
    name: 'Tomato',
    price: '10.00',

    category: 'Vegetable',
    id: 6,
    description: 'Fresh farm tomatoes with vibrant color and taste.',
    seller: sellers[2],
  ),
  ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Apple',
    price: '15.00',

    category: 'Fruits',
    id: 4,
    description: 'Crisp and juicy organic apples.',
    seller: sellers[3],
  ),
  ProductModel(
    image: 'assets/images/home/Broccoli.png',
    name: 'Carrot',
    price: '12.00',

    category: 'Vegetable',
    id: 5,
    description: 'Crunchy and sweet organic carrots.',
    seller: sellers[4],
  ),
  ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Apple',
    price: '15.00',

    category: 'Fruits',
    id: 6,
    description: 'Crisp and juicy organic apples.',
    seller: sellers[3],
  ), ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Apple',
    price: '15.00',

    category: 'Fruits',
    id: 7,
    description: 'Crisp and juicy organic apples.',
    seller: sellers[3],
  ), ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Apple',
    price: '15.00',

    category: 'Fruits',
    id: 8,
    description: 'Crisp and juicy organic apples.',
    seller: sellers[3],
  ), ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Apple',
    price: '15.00',

    category: 'Fruits',
    id: 9,
    description: 'Crisp and juicy organic apples.',
    seller: sellers[3],
  ), ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Apple',
    price: '15.00',

    category: 'Fruits',
    id: 10,
    description: 'Crisp and juicy organic apples.',
    seller: sellers[3],
  ),
];
