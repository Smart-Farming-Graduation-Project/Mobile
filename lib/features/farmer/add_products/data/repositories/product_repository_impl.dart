// import 'package:crop_guard/core/error/failures.dart';
// import 'package:dartz/dartz.dart';
// import '../../domain/entities/product.dart';
// import '../../domain/repositories/product_repository.dart';

// class ProductRepositoryImpl implements ProductRepository {
//   // final FirebaseFirestore firestore;

//   ProductRepositoryImpl();

//   @override
//   Future<Either<Failure, Product>> addProduct(Product product) async {
//     try {
//       // final docRef = await firestore.collection('products').add({
//       //   'name': product.name,
//       //   'description': product.description,
//       //   'price': product.price,
//       //   'quantity': product.quantity,
//       //   'imageUrl': product.imageUrl,
//       //   'createdAt': FieldValue.serverTimestamp(),
//       // });

//       final doc = await docRef.get();
//       final data = doc.data() as Map<String, dynamic>;

//       return Right(Product(
//         name: data['name'],
//         description: data['description'],
//         price: data['price'].toDouble(),
//         quantity: data['quantity'],
//         imageUrl: data['imageUrl'],
//       ));
//     } catch (e) {
//       return Left(ServerFailure());
//     }
//   }
// }
