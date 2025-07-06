import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../cubits/market_cubit.dart';
import '../cubits/market_state.dart';
import '../widgets/market_content.dart';
import '../../../../ecommerce/cart/presentation/views/cart_view.dart';
import '../../../../ecommerce/favorite/presentation/views/fav_screen.dart';
import '../../../../ecommerce/order/presentation/views/track_order_screen.dart';

class MarketView extends StatelessWidget {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarketCubit(),
      child: BlocBuilder<MarketCubit, MarketState>(
        builder: (context, state) {
          final selectedIndex = state is MarketLoaded
              ? state.pageIndex
              : 0; // Default to 0 if state is not MarketLoaded
          final List<Widget> pages = [
            const MarketContent(),
            const FavScreen(),
            const CartView(cartProductsList: []),
            const TrackOrderScreen(),
          ];

          return Scaffold(
            body: pages[selectedIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BottomNavigationBar(
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    context.read<MarketCubit>().changePage(index);
                  },
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.kPrimaryColor,
                  unselectedItemColor: Colors.grey,
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  backgroundColor: Colors.white,
                  iconSize: 24,
                  selectedFontSize: 0,
                  unselectedFontSize: 0,
                  items: List.generate(4, (index) {
                    List<IconData> icons = [
                      Iconsax.home5,
                      Iconsax.heart5,
                      Iconsax.shopping_cart5,
                      Iconsax.note_15,
                    ];
                    List<IconData> unselectedIcons = [
                      Iconsax.home,
                      Iconsax.heart,
                      Iconsax.shopping_cart,
                      Iconsax.note_14,
                    ];

                    return BottomNavigationBarItem(
                      icon: Container(
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.grey.shade200
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          child: Icon(
                            size: 24,
                            selectedIndex == index
                                ? icons[index]
                                : unselectedIcons[index],
                            color: selectedIndex == index
                                ? AppColors.kPrimaryColor
                                : AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                      label: "",
                    );
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
