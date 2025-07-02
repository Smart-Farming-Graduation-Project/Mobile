import 'dart:developer';

import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/farmer/my_products/domain/entities/my_product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/features/farmer/my_products/presentation/cubits/my_products_cubit.dart';
import 'package:crop_guard/features/farmer/my_products/presentation/views/widgets/my_product_card.dart';
import 'package:crop_guard/features/farmer/my_products/presentation/views/widgets/empty_products_widget.dart';
import 'package:go_router/go_router.dart';

class MyProductsView extends StatefulWidget {
  const MyProductsView({super.key});

  @override
  State<MyProductsView> createState() => _MyProductsViewState();
}

class _MyProductsViewState extends State<MyProductsView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    context.read<MyProductsCubit>().getMyProducts();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200.h) {
      context.read<MyProductsCubit>().loadMoreProducts();
    }
  }

  void _handleDeleteSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Product deleted successfully!'),
        backgroundColor: AppColors.kGreenColor,
      ),
    );
    // Refresh the products list
    getIt<MyProductsCubit>().getMyProducts();
  }

  void _handleError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.kDangerColor,
      ),
    );
  }

  void _navigateToAddProduct() {
    GoRouter.of(context).push(AppRouter.addProduct);
  }

  void _navigateToUpdateProduct(MyProductEntity product) {
    log(product.productImages.toString());
    GoRouter.of(context).push(AppRouter.updateProduct, extra: product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Products',
          style: TextStyle(fontSize: 18.sp),
        ),
        backgroundColor: AppColors.kGreenColor,
        foregroundColor: AppColors.kWhiteColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_outlined, size: 20.w),
        ),
        actions: [
          IconButton(
            onPressed: _navigateToAddProduct,
            icon: Icon(Icons.add, size: 20.w),
          ),
        ],
      ),
      body: BlocListener<MyProductsCubit, MyProductsState>(
        listener: (context, state) {
          if (state is DeleteProductSuccess) {
            _handleDeleteSuccess();
          } else if (state is DeleteProductError) {
            _handleError(state.message);
          } else if (state is MyProductsError) {
            _handleError(state.message);
          }
        },
        child: BlocBuilder<MyProductsCubit, MyProductsState>(
          builder: (context, state) {
            if (state is MyProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kGreenColor,
                ),
              );
            } else if (state is MyProductsLoaded) {
              if (state.products.isEmpty) {
                return const EmptyProductsWidget();
              }
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<MyProductsCubit>().getMyProducts();
                },
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.all(16.w),
                  itemCount:
                      state.products.length + (state.hasMoreData ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == state.products.length) {
                      // Show loading indicator at the bottom
                      return Padding(
                        padding: EdgeInsets.all(16.w),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.kGreenColor,
                          ),
                        ),
                      );
                    }

                    final product = state.products[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: MyProductCard(
                        product: product,
                        onEdit: () => _navigateToUpdateProduct(product),
                        onDelete: () =>
                            _showDeleteConfirmation(product.productId),
                      ),
                    );
                  },
                ),
              );
            } else if (state is MyProductsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64.w,
                      color: AppColors.kDangerColor,
                    ),
                    verticalSpace(16),
                    Text(
                      'Error loading products',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.kDangerColor,
                      ),
                    ),
                    verticalSpace(8),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    verticalSpace(16),
                    ElevatedButton(
                      onPressed: () {
                        getIt<MyProductsCubit>().getMyProducts();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kGreenColor,
                        foregroundColor: AppColors.kWhiteColor,
                      ),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _showDeleteConfirmation(int productId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Delete Product',
          style: TextStyle(fontSize: 18.sp),
        ),
        content: Text(
          'Are you sure you want to delete this product?',
          style: TextStyle(fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          TextButton(
            onPressed: () async {
              GoRouter.of(context).pop();
              await getIt<MyProductsCubit>().deleteProduct(productId);
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.kDangerColor,
            ),
            child: Text(
              'Delete',
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
