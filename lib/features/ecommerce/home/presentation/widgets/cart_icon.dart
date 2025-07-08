import 'package:badges/badges.dart' as badges;
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/ecommerce/cart/data/models/cart_product_model.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/cubits/cart_cubit.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/cubits/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..fetchCartProducts(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return GestureDetector(
              onTap: () {
                if (state is CartLoadedState) {
                  GoRouter.of(context).push(AppRouter.cart, extra: state.items );
                }else{
                  GoRouter.of(context).push(AppRouter.cart, extra: [] as List<CartProductModel>);
                }
              },
              child: badges.Badge(
                    badgeStyle:
                        const badges.BadgeStyle(badgeColor: AppColors.kPrimaryColor),
                    position: badges.BadgePosition.topEnd(top: -5, end: -5),
                    badgeContent: state is CartLoadedState
                        ? Text(state.items.length.toString(),
                            style: AppTextStyles.font12WhiteRegular)
                        : const SizedBox.shrink(),
                    child: const Icon(Icons.shopping_cart, size: 28),
              ),
          );
        },
      ),
    );
  }
}
