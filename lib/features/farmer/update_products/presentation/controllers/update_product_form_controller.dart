import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:crop_guard/core/helper/pick_image.dart';
import 'package:crop_guard/features/ecommerce/categories/data/models/category_model.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/categories_list.dart';
import 'package:crop_guard/features/farmer/update_products/domain/entities/update_product_entity.dart';
import 'package:crop_guard/features/farmer/update_products/domain/entities/product_image_entity.dart';

class UpdateProductFormController extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  List<ProductImageEntity> images = [];
  CategoryModel? selectedCategory;
  bool isAvailable = true;
  String? productId;

  // Image selection states
  bool isImageLoading = false;

  // Hot reload optimization
  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  // Safe notify listeners for hot reload compatibility
  void _safeNotifyListeners() {
    if (!_isDisposed) {
      notifyListeners();

      // Trigger post-frame callback for immediate UI update
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_isDisposed) {
          notifyListeners();
        }
      });
    }
  }

  // Initialize form with existing product data
  void initializeWithProduct({
    required String id,
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String category,
    required bool availability,
    List<String>? existingImages,
  }) {
    productId = id;
    nameController.text = name;
    descriptionController.text = description;
    priceController.text = price.toString();
    quantityController.text = quantity.toString();
    isAvailable = availability;

    // Set the selected category based on the category name
    _setCategoryFromName(category);

    // Convert existing image URLs to ProductImageEntity
    images = (existingImages ?? [])
        .map((url) => ProductImageEntity.fromUrl(url))
        .toList();

    _safeNotifyListeners();
  }

  // Helper method to set category from category name
  void _setCategoryFromName(String categoryName) {
    selectedCategory = categoriesList.firstWhere(
      (category) => category.categoryName == categoryName,
      orElse: () =>
          categoriesList.first, // Default to first category if not found
    );
  }

  // Enhanced image handling with hot reload optimization
  Future<void> pickImages() async {
    // Check if we can add more images
    if (images.length >= 5) {
      return;
    }

    // Set loading state
    isImageLoading = true;
    _safeNotifyListeners();

    try {
      final image = await pickImage();

      if (image != null) {
        // Validate image size (optional - you can adjust the limit)
        final fileSize = await image.length();
        const maxSize = 5 * 1024 * 1024; // 5MB limit

        if (fileSize > maxSize) {
          return;
        }

        images.add(ProductImageEntity.fromFile(image));

        // Immediate UI update
        _safeNotifyListeners();
      }
    } catch (e) {
      // Error handling
    } finally {
      isImageLoading = false;
      _safeNotifyListeners();
    }
  }

  void removeImage(int index) {
    if (index >= 0 && index < images.length) {
      images.removeAt(index);

      // Immediate UI update
      _safeNotifyListeners();
    }
  }

  // Get total image count
  int get totalImageCount => images.length;

  // Check if can add more images
  bool get canAddMoreImages => images.length < 5;

  // Category handling
  void setSelectedCategory(CategoryModel category) {
    selectedCategory = category;
    _safeNotifyListeners();
  }

  // Get selected category name
  String get selectedCategoryName =>
      selectedCategory?.categoryName ?? 'Select Category';

  // Availability handling
  void setAvailability(bool value) {
    isAvailable = value;
    _safeNotifyListeners();
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

    if (selectedCategory == null) {
      return false;
    }

    // Check if at least one image is present (either existing or new)
    if (images.isEmpty) {
      return false;
    }

    return true;
  }

  // Get validation errors
  List<String> getValidationErrors() {
    List<String> errors = [];

    if (selectedCategory == null) {
      errors.add('Please select a category');
    }

    if (images.isEmpty) {
      errors.add('Please select at least one image');
    }

    return errors;
  }

  // Create update product entity
  UpdateProductEntity? createUpdateProductEntity() {
    if (!validateForm() || productId == null) {
      return null;
    }

    return UpdateProductEntity(
      id: productId!,
      name: nameController.text,
      description: descriptionController.text,
      price: double.parse(priceController.text),
      quantity: int.parse(quantityController.text),
      category: selectedCategory!.categoryName,
      images: images,
      isAvailable: isAvailable,
    );
  }

  // Reset form
  void resetForm() {
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    quantityController.clear();
    images.clear();
    selectedCategory = null;
    isAvailable = true;
    productId = null;
    isImageLoading = false;

    _safeNotifyListeners();
  }
}
