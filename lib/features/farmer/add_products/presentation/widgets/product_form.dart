// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/add_products_bloc.dart';

// class ProductForm extends StatefulWidget {
//   const ProductForm({super.key});

//   @override
//   State<ProductForm> createState() => _ProductFormState();
// }

// class _ProductFormState extends State<ProductForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   final _priceController = TextEditingController();
//   final _quantityController = TextEditingController();
//   final _imageUrlController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _descriptionController.dispose();
//     _priceController.dispose();
//     _quantityController.dispose();
//     _imageUrlController.dispose();
//     super.dispose();
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       context.read<AddProductsBloc>().add(
//             AddProductSubmitted(
//               name: _nameController.text,
//               description: _descriptionController.text,
//               price: double.parse(_priceController.text),
//               quantity: int.parse(_quantityController.text),
//               imageUrl: _imageUrlController.text,
//             ),
//           );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AddProductsBloc, AddProductsState>(
//       listener: (context, state) {
//         if (state is AddProductsSuccess) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Product added successfully!')),
//           );
//           Navigator.pop(context);
//         } else if (state is AddProductsError) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(state.message)),
//           );
//         }
//       },
//       child: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(labelText: 'Product Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a product name';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: const InputDecoration(labelText: 'Description'),
//                 maxLines: 3,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a description';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _priceController,
//                 decoration: const InputDecoration(labelText: 'Price'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a price';
//                   }
//                   if (double.tryParse(value) == null) {
//                     return 'Please enter a valid number';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _quantityController,
//                 decoration: const InputDecoration(labelText: 'Quantity'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a quantity';
//                   }
//                   if (int.tryParse(value) == null) {
//                     return 'Please enter a valid number';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _imageUrlController,
//                 decoration: const InputDecoration(labelText: 'Image URL'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an image URL';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 24),
//               BlocBuilder<AddProductsBloc, AddProductsState>(
//                 builder: (context, state) {
//                   return ElevatedButton(
//                     onPressed: state is AddProductsLoading ? null : _submitForm,
//                     child: state is AddProductsLoading
//                         ? const CircularProgressIndicator()
//                         : const Text('Add Product'),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
