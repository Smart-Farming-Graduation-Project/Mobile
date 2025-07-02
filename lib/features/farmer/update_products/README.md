# Update Products Feature - Clean Architecture

This feature implements Clean Architecture for updating existing products in the Crop Guard API.

## 🏗️ Architecture Overview

### Domain Layer
- **UpdateProductEntity**: Core business entity with product ID
- **UpdateProductRepository**: Abstract repository interface
- **UpdateProduct**: Use case for updating products

### Data Layer
- **UpdateProductModel**: Data model with JSON serialization
- **UpdateProductRemoteDataSource**: API data source interface
- **UpdateProductRemoteDataSourceImpl**: Dio-based API implementation
- **UpdateProductRepositoryImpl**: Repository implementation

### Presentation Layer
- **UpdateProductCubit**: State management
- **UpdateProductState**: States (Initial, Loading, Success, Error)
- **UpdateProductsView**: Main UI with pre-populated form
- **UpdateProductsPage**: Page wrapper with BlocProvider
- **UpdateProductFormController**: Form state management

## 🚀 Setup

1. **Initialize Dependency Injection** in `main.dart`:
```dart
import 'features/farmer/update_products/di/update_products_di.dart';

void main() {
  setupUpdateProductsDI();
  runApp(MyApp());
}
```

2. **Navigate to the page** with product data:
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => UpdateProductsPage(
      productData: {
        'id': 'product_id',
        'name': 'Product Name',
        'description': 'Product Description',
        'price': 15.5,
        'quantity': 10,
        'category': 'vegetables',
        'availability': true,
        'images': ['image1.jpg', 'image2.jpg'],
      },
    ),
  ),
);
```

## 📡 API Integration

The feature integrates with the Crop Guard API endpoint:
```
PUT /api/Product/Product/Update/{id}
```

### Request Format
- **Query Parameters**: Product data (Name, Description, Price, Quantity, CategoryName, Availability)
- **Form Data**: New images as multipart files

### Example Request
```bash
curl -X 'PUT' \
  'https://crop-pilot-api.azurewebsites.net/api/Product/Product/Update/product_id?Name=updated_name&Description=updated_description&Price=20.0&Quantity=15&CategoryName=vegetables&Availability=Sale' \
  -H 'accept: */*' \
  -H 'Content-Type: multipart/form-data' \
  -F 'Images=@new_image.jpg;type=image/jpeg'
```

## 🔄 Data Flow

1. **Form pre-populated** → **User modifies data** → **Validation** → **Create UpdateProductEntity**
2. **Cubit receives entity** → **Call Use Case** → **Repository** → **Data Source**
3. **API call** → **Response** → **UpdateProductModel** → **Success State**
4. **UI updates** → **Show success message** → **Navigate back**

## 🎯 Key Features

### Pre-populated Form
- Automatically fills form fields with existing product data
- Shows existing images as preview (read-only)
- Allows adding new images to existing ones

### Validation
- Form validation for all required fields
- Category selection validation
- Image handling (optional for updates)

### State Management
- Loading states during API calls
- Success/error handling
- Form reset after successful update

## 🧪 Testing

Each layer can be tested independently:

```dart
// Test Use Case
final mockRepository = MockUpdateProductRepository();
final useCase = UpdateProduct(mockRepository);
final result = await useCase(updateProductEntity);

// Test Cubit
final cubit = UpdateProductCubit(updateProductUseCase: useCase);
cubit.updateProduct(updateProductEntity);
expect(cubit.state, isA<UpdateProductSuccess>());
```

## 📁 File Structure

```
update_products/
├── domain/
│   ├── entities/
│   │   └── update_product_entity.dart
│   ├── repositories/
│   │   └── update_product_repository.dart
│   └── usecases/
│       └── update_product.dart
├── data/
│   ├── models/
│   │   └── update_product_model.dart
│   ├── datasources/
│   │   └── update_product_remote_data_source.dart
│   └── repositories/
│       └── update_product_repository_impl.dart
├── presentation/
│   ├── cubits/
│   │   ├── update_product_cubit.dart
│   │   └── update_product_state.dart
│   ├── controllers/
│   │   └── update_product_form_controller.dart
│   └── views/
│       ├── update_products_page.dart
│       ├── update_products_view.dart
│       └── widgets/
│           └── update_product_form_widget.dart
├── di/
│   └── update_products_di.dart
├── update_products_exports.dart
└── README.md
```

## 🔧 Configuration

Make sure your Dio instance is properly configured with:
- Base URL: `https://crop-pilot-api.azurewebsites.net`
- Headers: `accept: */*`
- Timeout settings
- Interceptors for authentication if needed

## 🔄 Differences from Add Product

1. **Entity**: Includes product ID for identification
2. **API**: Uses PUT method instead of POST
3. **Form**: Pre-populated with existing data
4. **Images**: Handles existing images + new images
5. **Validation**: Less strict (images optional for updates)

## 📝 Usage Example

```dart
// In your product list or detail screen
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateProductsPage(
          productData: {
            'id': product.id,
            'name': product.name,
            'description': product.description,
            'price': product.price,
            'quantity': product.quantity,
            'category': product.category,
            'availability': product.isAvailable,
            'images': product.images,
          },
        ),
      ),
    );
  },
  child: Text('Edit Product'),
)
``` 