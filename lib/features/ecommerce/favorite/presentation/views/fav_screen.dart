import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/cubits/favorite_state.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/widgets/empty_favorite.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/widgets/favorite_product_item.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/widgets/search_filter_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..loadFavorites(),
      child: Column(
        children: [
          AppBar(
            backgroundColor: AppColors.kPrimaryColor,
            title: const Text(
              'Favorite Products',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.kWhiteColor,
              ),
            ),
          ),
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteLoading) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is FavoriteError) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else if (state is FavoriteEmpty) {
                return const EmptyFavorite();
              } else if (state is FavoriteSuccess) {
                return Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Flexible(child: SearchBarFilter()),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Symbols.instant_mix,
                                  color: AppColors.kPrimaryColor,
                                  size: 34,
                                ))
                          ],
                        ),
                        Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.all(12),
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.favoriteProducts.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.7,
                            ),
                            itemBuilder: (context, index) {
                              return FavoriteProductItem(
                                favoriteProduct: state.favoriteProducts[index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              // Default case if none of the above states match
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
