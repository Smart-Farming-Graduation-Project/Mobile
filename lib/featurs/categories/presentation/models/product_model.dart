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
];

class ProductModel {
  final String name;
  final String category;
  final String image;
  final String price;
  final String amount;
  final String id;
  final String description;
  final SellerModel seller;
  bool isFavorite;

  ProductModel({
    required this.name,
    required this.category,
    required this.image,
    required this.amount,
    required this.price,
    required this.id,
    required this.description,
    required this.seller,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      category: json['category'],
      image: json['image'],
      price: json['price'],
      amount: json['amount'],
      id: json['id'],
      description: json['description'],
      isFavorite: json['isFavorite'] ?? false,
      seller: SellerModel.fromJson(json['seller']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'image': image,
      'price': price,
      'amount': amount,
      'id': id,
      'description': description,
      'isFavorite': isFavorite,
      'seller': seller.toJson(),
    };
  }
}

final List<ProductModel> products = [
  ProductModel(
    image: 'assets/images/home/Broccoli.png',
    name: 'Broccoli',
    price: '18.00',
    category: 'Vegetable',
    amount: 'Piece',
    id: '1',
    description: 'Fresh organic broccoli directly from the farm.',
    seller: sellers[0],
  ),
  ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Avocado',
    price: '25.00',
    amount: 'Piece',
    category: 'Fruits',
    id: '2',
    description: 'Organic avocado with rich taste and high quality.',
    seller: sellers[1],
  ),
  ProductModel(
    image: 'assets/images/home/Broccoli.png',
    name: 'Tomato',
    price: '10.00',
    amount: 'Kg',
    category: 'Vegetable',
    id: '3',
    description: 'Fresh farm tomatoes with vibrant color and taste.',
    seller: sellers[2],
  ),
  ProductModel(
    image: 'assets/images/home/Avocado.png',
    name: 'Apple',
    price: '15.00',
    amount: 'Kg',
    category: 'Fruits',
    id: '4',
    description: 'Crisp and juicy organic apples.',
    seller: sellers[3],
  ),
  ProductModel(
    image: 'assets/images/home/Broccoli.png',
    name: 'Carrot',
    price: '12.00',
    amount: 'Kg',
    category: 'Vegetable',
    id: '5',
    description: 'Crunchy and sweet organic carrots.',
    seller: sellers[4],
  ),
];
