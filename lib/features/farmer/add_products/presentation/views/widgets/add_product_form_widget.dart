import 'package:crop_guard/features/farmer/add_products/presentation/views/widgets/submit_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/categories_list.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/controllers/add_product_form_controller.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/views/widgets/image_section_widget.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/views/widgets/custom_text_field_widget.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/views/widgets/category_section_widget.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/views/widgets/availability_section_widget.dart';

class AddProductFormWidget extends StatelessWidget {
  final AddProductFormController controller;
  final VoidCallback? onSubmit;

  const AddProductFormWidget({
    super.key,
    required this.controller,
    required this.onSubmit,
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
              'Select Category',
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
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Selection Section
                ImageSectionWidget(
                  selectedImages: controller.selectedImages,
                  onPickImage: controller.pickImages,
                  onRemoveImage: controller.removeImage,
                  isImageLoading: controller.isImageLoading,
                ),
                verticalSpace(24),

                // Product Name
                CustomTextFieldWidget(
                  controller: controller.nameController,
                  label: 'Product Name',
                  hint: 'Enter product name',
                  validator: controller.validateName,
                ),
                verticalSpace(16),

                // Description
                CustomTextFieldWidget(
                  controller: controller.descriptionController,
                  label: 'Description',
                  hint: 'Enter product description',
                  maxLines: 3,
                  validator: controller.validateDescription,
                ),
                verticalSpace(16),

                // Price and Quantity Row
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldWidget(
                        controller: controller.priceController,
                        label: 'Price',
                        hint: '0.00',
                        keyboardType: TextInputType.number,
                        prefix: '\$',
                        validator: controller.validatePrice,
                      ),
                    ),
                    horizontalSpace(16),
                    Expanded(
                      child: CustomTextFieldWidget(
                        controller: controller.quantityController,
                        label: 'Quantity',
                        hint: '0',
                        keyboardType: TextInputType.number,
                        validator: controller.validateQuantity,
                      ),
                    ),
                  ],
                ),
                verticalSpace(16),

                // Category Selection
                CategorySectionWidget(
                  selectedCategory: controller.selectedCategory,
                  onTap: () => _showCategoryPicker(context),
                ),
                verticalSpace(16),

                // Availability Toggle
                AvailabilitySectionWidget(
                  isAvailable: controller.isAvailable,
                  onChanged: controller.setAvailability,
                ),
                verticalSpace(32),

                // Submit Button
                SubmitButtonWidget(
                  buttonText: 'Add Product',
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
