import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/categories_list.dart';
import 'package:crop_guard/features/farmer/update_products/presentation/controllers/update_product_form_controller.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/views/widgets/custom_text_field_widget.dart';
import 'package:crop_guard/features/farmer/update_products/presentation/views/widgets/unified_image_section_widget.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/views/widgets/category_section_widget.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/views/widgets/availability_section_widget.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/views/widgets/submit_button_widget.dart';

class UpdateProductFormWidget extends StatelessWidget {
  final UpdateProductFormController controller;
  final VoidCallback? onSubmit;

  const UpdateProductFormWidget({
    super.key,
    required this.controller,
    this.onSubmit,
  });

  void _showCategoryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              controller.selectedCategoryName,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.kBlackColor,
              ),
            ),
            verticalSpace(16),
            Expanded(
              child: ListView.builder(
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  final category = categoriesList[index];
                  return ListTile(
                    leading: Image.network(
                      category.image,
                      width: 40.w,
                      height: 40.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                    title: Text(category.categoryName),
                    subtitle: Text(category.categoryDescription),
                    onTap: () {
                      controller.setSelectedCategory(category);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Product Images Section
                UnifiedImageSectionWidget(
                  images: controller.images,
                  onPickImage: controller.pickImages,
                  onRemoveImage: controller.removeImage,
                  isImageLoading: controller.isImageLoading,
                ),

                const SizedBox(height: 24),

                // Product Name
                CustomTextFieldWidget(
                  controller: controller.nameController,
                  label: 'Product Name',
                  hint: 'Enter product name',
                  validator: controller.validateName,
                ),

                const SizedBox(height: 16),

                // Product Description
                CustomTextFieldWidget(
                  controller: controller.descriptionController,
                  label: 'Product Description',
                  hint: 'Enter product description',
                  validator: controller.validateDescription,
                  maxLines: 3,
                ),

                const SizedBox(height: 16),

                // Price and Quantity Row
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldWidget(
                        controller: controller.priceController,
                        label: 'Price',
                        hint: 'Enter price',
                        validator: controller.validatePrice,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextFieldWidget(
                        controller: controller.quantityController,
                        label: 'Quantity',
                        hint: 'Enter quantity',
                        validator: controller.validateQuantity,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Category Section
                CategorySectionWidget(
                  selectedCategory: controller.selectedCategory,
                  onTap: () => _showCategoryPicker(context),
                ),

                const SizedBox(height: 24),

                // Availability Section
                AvailabilitySectionWidget(
                  isAvailable: controller.isAvailable,
                  onChanged: controller.setAvailability,
                ),

                const SizedBox(height: 32),

                // Submit Button
                SubmitButtonWidget(
                  buttonText: 'Update Product',
                  onPressed: onSubmit ?? () {},
                  isLoading: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
