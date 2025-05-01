class CartProduct {
  final String id;
  final String title;
  int quantity;
  final double currentPrice;
  final double originalPrice;
  final String imageUrl;
  final String category;

  CartProduct(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.currentPrice,
      required this.originalPrice,
      required this.imageUrl,
      required this.category});
  CartProduct copyWith({
    String? id,
    String? title,
    int? quantity,
    double? currentPrice,
    double? originalPrice,
    String? imageUrl,
    String? category,
  }) {
    return CartProduct(
      id: id ?? this.id,
      title: title ?? this.title,
      quantity: quantity ?? this.quantity,
      currentPrice: currentPrice ?? this.currentPrice,
      originalPrice: originalPrice ?? this.originalPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
    );
  }
}


//demo data for cart
List<CartProduct> cartProducts = [
  CartProduct(
    id: "1",
    title: "Tomato",
    quantity: 1,
    currentPrice: 10.0,
    originalPrice: 20.0,
    imageUrl:
        "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
    category: "Category 1",
  ),
  CartProduct(
    id: "2",
    title: "Product 2",
    quantity: 2,
    currentPrice: 15.0,
    originalPrice: 25.0,
    imageUrl:
        "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
    category: "Category 2",
  ),
  CartProduct(
    id: "3",
    title: "Product 3",
    quantity: 3,
    currentPrice: 20.0,
    originalPrice: 30.0,
    imageUrl:
        "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
    category: "Category 3",
  ),
  CartProduct(
    id: "4",
    title: "Product 4",
    quantity: 4,
    currentPrice: 25.0,
    originalPrice: 35.0,
    imageUrl:
        "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
    category: "Category 4",
  ),
];
