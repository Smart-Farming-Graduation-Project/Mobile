# My Products Feature

This feature allows farmers to view, manage, and delete their products.

## Architecture

The feature follows Clean Architecture principles with the following structure:

```
my_products/
├── data/
│   ├── datasources/
│   │   └── my_products_remote_data_source.dart
│   ├── models/
│   │   └── my_product_model.dart
│   └── repositories/
│       └── my_products_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── my_product_entity.dart
│   ├── repositories/
│   │   └── my_products_repository.dart
│   └── usecases/
│       ├── get_my_products.dart
│       └── delete_my_product.dart
└── presentation/
    ├── cubits/
    │   ├── my_products_cubit.dart
    │   └── my_products_state.dart
    └── views/
        ├── my_products_view.dart
        └── widgets/
            ├── my_product_card.dart
            └── empty_products_widget.dart
```

## Features

- **View Products**: Display all products owned by the farmer with pagination
- **Pagination**: Load products in pages of 10 items with infinite scroll
- **Delete Products**: Remove products from the marketplace
- **Edit Products**: Navigate to the update products feature
- **Add Products**: Navigate to the add products feature
- **Pull to Refresh**: Refresh the products list
- **Empty State**: Show a helpful message when no products exist
- **Load More**: Automatically load more products when scrolling to the bottom

## Usage

To use this feature, you need to:

1. Register the dependencies in your service locator
2. Add the route to your app router
3. Provide the MyProductsCubit to the widget tree

### Example Usage

```dart
// In your service locator
sl.registerLazySingleton<MyProductsRemoteDataSource>(
  () => MyProductsRemoteDataSourceImpl(apiConsumer: sl()),
);

sl.registerLazySingleton<MyProductsRepository>(
  () => MyProductsRepositoryImpl(remoteDataSource: sl()),
);

sl.registerLazySingleton<GetMyProducts>(
  () => GetMyProducts(sl()),
);

sl.registerLazySingleton<DeleteMyProduct>(
  () => DeleteMyProduct(sl()),
);

sl.registerFactory<MyProductsCubit>(
  () => MyProductsCubit(
    getMyProductsUseCase: sl(),
    deleteMyProductUseCase: sl(),
  ),
);

// In your widget tree
BlocProvider(
  create: (context) => sl<MyProductsCubit>(),
  child: const MyProductsView(),
)
```

## API Endpoints

The feature uses the following API endpoints:

- `GET /Product/ProductsByUserId?PageNumber={page}&PageSize={size}` - Get farmer's products with pagination
- `GET /farmer/products/{id}` - Get a specific product
- `DELETE /farmer/products/{id}` - Delete a product
- `PUT /farmer/products/{id}` - Update a product

### Pagination Parameters

- `PageNumber`: The page number to fetch (starts from 1)
- `PageSize`: Number of items per page (default: 10)

## States

The feature manages the following states:

- `MyProductsInitial` - Initial state
- `MyProductsLoading` - Loading products
- `MyProductsLoaded` - Products loaded successfully
- `MyProductsError` - Error loading products
- `DeleteProductLoading` - Deleting a product
- `DeleteProductSuccess` - Product deleted successfully
- `DeleteProductError` - Error deleting product 