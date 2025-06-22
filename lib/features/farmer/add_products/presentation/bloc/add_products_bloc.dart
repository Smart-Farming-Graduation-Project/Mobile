// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
// import '../../domain/entities/product.dart';
// import '../../domain/usecases/add_product.dart';

// // Events
// abstract class AddProductsEvent extends Equatable {
//   const AddProductsEvent();

//   @override
//   List<Object> get props => [];
// }

// class AddProductSubmitted extends AddProductsEvent {
//   final String name;
//   final String description;
//   final double price;
//   final int quantity;
//   final String imageUrl;

//   const AddProductSubmitted({
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.quantity,
//     required this.imageUrl,
//   });

//   @override
//   List<Object> get props => [name, description, price, quantity, imageUrl];
// }

// // States
// abstract class AddProductsState extends Equatable {
//   const AddProductsState();

//   @override
//   List<Object> get props => [];
// }

// class AddProductsInitial extends AddProductsState {}

// class AddProductsLoading extends AddProductsState {}

// class AddProductsSuccess extends AddProductsState {
//   final Product product;

//   const AddProductsSuccess(this.product);

//   @override
//   List<Object> get props => [product];
// }

// class AddProductsError extends AddProductsState {
//   final String message;

//   const AddProductsError(this.message);

//   @override
//   List<Object> get props => [message];
// }

// // Bloc
// class AddProductsBloc extends Bloc<AddProductsEvent, AddProductsState> {
//   final AddProduct addProduct;

//   AddProductsBloc({required this.addProduct}) : super(AddProductsInitial()) {
//     on<AddProductSubmitted>(_onAddProductSubmitted);
//   }

//   Future<void> _onAddProductSubmitted(
//     AddProductSubmitted event,
//     Emitter<AddProductsState> emit,
//   ) async {
//     emit(AddProductsLoading());
//     try {
//       final product = Product(
//         name: event.name,
//         description: event.description,
//         price: event.price,
//         quantity: event.quantity,
//         imageUrl: event.imageUrl,
//       );

//       final result = await addProduct(product);
//       result.fold(
//         (failure) => emit(AddProductsError(failure.toString())),
//         (product) => emit(AddProductsSuccess(product)),
//       );
//     } catch (e) {
//       emit(AddProductsError(e.toString()));
//     }
//   }
// }
