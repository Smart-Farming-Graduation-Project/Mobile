# Add Products Feature - Clean Architecture

This feature implements Clean Architecture for adding products to the Crop Guard API.

## 🏗️ Architecture Overview

### Domain Layer
- **ProductEntity**: Core business entity
- **ProductRepository**: Abstract repository interface
- **AddProduct**: Use case for adding products

### Data Layer
- **ProductModel**: Data model with JSON serialization
- **ProductRemoteDataSource**: API data source interface
- **ProductRemoteDataSourceImpl**: Dio-based API implementation
- **ProductRepositoryImpl**: Repository implementation

### Presentation Layer
- **AddProductCubit**: State management
- **AddProductState**: States (Initial, Loading, Success, Error)
- **AddProductsView**: Main UI with form
- **AddProductsPage**: Page wrapper with BlocProvider

## 🚀 Setup

1. **Initialize Dependency Injection** in `main.dart`:
```dart
import 'features/farmer/add_products/di/add_products_di.dart';

void main() {
  setupAddProductsDI();
  runApp(MyApp());
}
```

2. **Navigate to the page**:
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const AddProductsPage()),
);
```

## 📡 API Integration

The feature integrates with the Crop Guard API endpoint:
```
POST /api/Product/Product/Create
```

### Request Format
- **Query Parameters**: Product data (Name, Description, Price, Quantity, CategoryName, Availability)
- **Form Data**: Images as multipart files

### Example Request
```bash
curl -X 'POST' \
  'https://crop-pilot-api.azurewebsites.net/api/Product/Product/Create?Name=paper&Description=xck.dhfgyjher&Price=15.5&CategoryName=vegatables&Availability=Sale' \
  -H 'accept: */*' \
  -H 'Content-Type: multipart/form-data' \
  -F 'Images=@image1.jpg;type=image/jpeg' \
  -F 'Images=@image2.jpg;type=image/jpeg'
```

## 🔄 Data Flow

1. **User fills form** → **Validation** → **Create ProductEntity**
2. **Cubit receives entity** → **Call Use Case** → **Repository** → **Data Source**
3. **API call** → **Response** → **ProductModel** → **Success State**
4. **UI updates** → **Show success message** → **Navigate back**

## 🧪 Testing

Each layer can be tested independently:

```dart
// Test Use Case
final mockRepository = MockProductRepository();
final useCase = AddProduct(mockRepository);
final result = await useCase(product);

// Test Cubit
final cubit = AddProductCubit(addProductUseCase: useCase);
cubit.addProduct(product);
expect(cubit.state, isA<AddProductSuccess>());
```

## 📁 File Structure

```
add_products/
├── domain/
│   ├── entities/
│   │   └── product_entity.dart
│   ├── repositories/
│   │   └── product_repository.dart
│   └── usecases/
│       └── add_product.dart
├── data/
│   ├── models/
│   │   └── product_model.dart
│   ├── datasources/
│   │   └── product_remote_data_source.dart
│   └── repositories/
│       └── product_repository_impl.dart
├── presentation/
│   ├── cubits/
│   │   ├── add_product_cubit.dart
│   │   └── add_product_state.dart
│   └── views/
│       ├── add_products_page.dart
│       ├── add_products_view.dart
│       └── widgets/
│           ├── image_section_widget.dart
│           ├── custom_text_field_widget.dart
│           ├── category_section_widget.dart
│           ├── availability_section_widget.dart
│           └── submit_button_widget.dart
├── di/
│   └── add_products_di.dart
├── add_products_exports.dart
└── README.md
```

## 🔧 Configuration

Make sure your Dio instance is properly configured with:
- Base URL: `https://crop-pilot-api.azurewebsites.net`
- Headers: `accept: */*`
- Timeout settings
- Interceptors for authentication if needed 