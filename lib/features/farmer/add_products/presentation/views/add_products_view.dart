import 'package:crop_guard/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/cubits/add_product_cubit.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/controllers/add_product_form_controller.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/views/widgets/add_product_form_widget.dart';
import 'package:go_router/go_router.dart';

class AddProductsView extends StatefulWidget {
  const AddProductsView({super.key});

  @override
  State<AddProductsView> createState() => _AddProductsViewState();
}

class _AddProductsViewState extends State<AddProductsView> {
  late final AddProductFormController _formController;

  @override
  void initState() {
    super.initState();
    _formController = AddProductFormController();
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

    final product = _formController.createProductEntity();
    if (product != null) {
      getIt<AddProductCubit>().addProduct(product);
    }
  }

  void _handleSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Product added successfully!'),
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
        title: const Text('Add New Product'),
        backgroundColor: AppColors.kGreenColor,
        foregroundColor: AppColors.kWhiteColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: BlocListener<AddProductCubit, AddProductState>(
        listener: (context, state) {
          if (state is AddProductSuccess) {
            _handleSuccess();
          } else if (state is AddProductError) {
            _handleError(state.message);
          }
        },
        child: BlocBuilder<AddProductCubit, AddProductState>(
          builder: (context, state) {
            return Stack(
              children: [
                AddProductFormWidget(
                  controller: _formController,
                  onSubmit: state is AddProductLoading ? null : _handleSubmit,
                ),
                if (state is AddProductLoading)
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
