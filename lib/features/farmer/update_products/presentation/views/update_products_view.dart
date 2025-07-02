import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/farmer/my_products/domain/entities/my_product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/farmer/update_products/presentation/cubits/update_product_cubit.dart';
import 'package:crop_guard/features/farmer/update_products/presentation/controllers/update_product_form_controller.dart';
import 'package:crop_guard/features/farmer/update_products/presentation/views/widgets/update_product_form_widget.dart';
import 'package:go_router/go_router.dart';

class UpdateProductsView extends StatefulWidget {
  final MyProductEntity productData;

  const UpdateProductsView({
    super.key,
    required this.productData,
  });

  @override
  State<UpdateProductsView> createState() => _UpdateProductsViewState();
}

class _UpdateProductsViewState extends State<UpdateProductsView> {
  late final UpdateProductFormController _formController;

  @override
  void initState() {
    super.initState();
    _formController = UpdateProductFormController();

    // Initialize form with existing product data if provided
    _formController.initializeWithProduct(
      id: widget.productData.productId.toString(),
      name: widget.productData.productName,
      description: widget.productData.productDescription,
      price: widget.productData.productPrice,
      quantity: 50,
      category: widget.productData.categoryName ?? '',
      availability:
          widget.productData.productAvailability.toLowerCase() == "sale",
      existingImages: widget.productData.productImages,
    );
  }

  @override
  void dispose() {
    _formController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final validationErrors = _formController.getValidationErrors();

    if (validationErrors.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(validationErrors.first),
          backgroundColor: AppColors.kDangerColor,
        ),
      );
      return;
    }

    final product = _formController.createUpdateProductEntity();
    if (product != null) {
      getIt<UpdateProductCubit>().updateProduct(product);
    }
  }

  void _handleSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Product updated successfully!'),
        backgroundColor: AppColors.kGreenColor,
      ),
    );
    _formController.resetForm();
    GoRouter.of(context).pop();
  }

  void _handleError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.kDangerColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        backgroundColor: AppColors.kGreenColor,
        foregroundColor: AppColors.kWhiteColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: BlocListener<UpdateProductCubit, UpdateProductState>(
        listener: (context, state) {
          if (state is UpdateProductSuccess) {
            _handleSuccess();
          } else if (state is UpdateProductError) {
            _handleError(state.message);
          }
        },
        child: BlocBuilder<UpdateProductCubit, UpdateProductState>(
          builder: (context, state) {
            return Stack(
              children: [
                UpdateProductFormWidget(
                  controller: _formController,
                  onSubmit:
                      state is UpdateProductLoading ? null : _handleSubmit,
                ),
                if (state is UpdateProductLoading)
                  Container(
                    color: Colors.black.withValues(alpha: 0.3),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kGreenColor,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
