class CartProductModel {
  final int id;
  final int productId;
  final String productName;
  final String productDescription;
  final double productPrice;
  final int quantity;
  final String productImage;

  CartProductModel({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.quantity,
    required this.productImage,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      productId: json['productId'],
      productName: json['productName'],
      productDescription: json['productDescription'],
      productPrice: json['productPrice'],
      quantity: json['quantity'],
      productImage: json['productImages'][0],
    );
  }
}

// demo data
List<CartProductModel> cartProducts = [
  CartProductModel(
    id: 1,
    productId: 1,
    productName: "Product 1",
    productDescription: "Description 1",
    productPrice: 10,
    quantity: 2,
    productImage:
        "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
  ),
  CartProductModel(
    id: 2,
    productId: 2,
    productName: "Product 2",
    productDescription: "Description 2",
    productPrice: 15,
    quantity: 1,
    productImage:
        "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
  ),
  CartProductModel(
    id: 3,
    productId: 3,
    productName: "Product 3",
    productDescription: "Description 3",
    productPrice: 20,
    quantity: 3,
    productImage:
        "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
  ),
];
