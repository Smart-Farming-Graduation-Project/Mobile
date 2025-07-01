import 'dart:io';
import 'package:flutter/material.dart';
import 'package:crop_guard/core/helper/pick_image.dart';
import 'package:crop_guard/features/ecommerce/categories/data/models/category_model.dart';
import 'package:crop_guard/features/farmer/add_products/domain/entities/product_entity.dart';

class AddProductFormController extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  List<File> selectedImages = [];
  CategoryModel? selectedCategory;
  bool isAvailable = true;

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  // Image handling
  Future<void> pickImages() async {
    final image = await pickImage();
    if (image != null) {
      selectedImages.add(image);
      notifyListeners();
    }
  }

  void removeImage(int index) {
    selectedImages.removeAt(index);
    notifyListeners();
  }

  // Category handling
  void setSelectedCategory(CategoryModel category) {
    selectedCategory = category;
    notifyListeners();
  }

  // Availability handling
  void setAvailability(bool value) {
    isAvailable = value;
    notifyListeners();
  }

  // Form validation
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter product name';
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter product description';
    }
    return null;
  }

  String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter price';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter valid price';
    }
    return null;
  }

  String? validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter quantity';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter valid quantity';
    }
    return null;
  }

  // Form submission validation
  bool validateForm() {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    if (selectedImages.isEmpty) {
      return false;
    }

    if (selectedCategory == null) {
      return false;
    }

    return true;
  }

  // Get validation errors
  List<String> getValidationErrors() {
    List<String> errors = [];

    if (selectedImages.isEmpty) {
      errors.add('Please select at least one image');
    }

    if (selectedCategory == null) {
      errors.add('Please select a category');
    }

    return errors;
  }

  // Create product entity
  ProductEntity? createProductEntity() {
    if (!validateForm()) {
      return null;
    }

    return ProductEntity(
      name: nameController.text,
      description: descriptionController.text,
      price: double.parse(priceController.text),
      quantity: int.parse(quantityController.text),
      category: selectedCategory!.categoryName,
      images: selectedImages,
      isAvailable: isAvailable,
    );
  }

  // Reset form
  void resetForm() {
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    quantityController.clear();
    selectedImages.clear();
    selectedCategory = null;
    isAvailable = true;
    notifyListeners();
  }
}
