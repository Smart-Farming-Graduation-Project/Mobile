import 'package:crop_guard/features/ecommerce/favorite/presentation/views/fav_screen.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/cubits/home_cubit.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/cubits/home_state.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/widgets/home_content.dart';
import 'package:crop_guard/features/ecommerce/order/presentation/views/track_order_screen.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final selectedIndex = state is HomeLoaded
              ? state.pageIndex
              : 0; // Default to 0 if state is not HomeLoaded
          final List<Widget> pages = [
            const HomeContent(),
            const FavScreen(),
            const TrackOrderScreen(),
            const ProfileView(),
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
                    context.read<HomeCubit>().changePage(index);
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
                      Iconsax.note_15,
                      Iconsax.profile_2user5,
                    ];
                    List<IconData> unselectedIcons = [
                      Iconsax.home,
                      Iconsax.heart,
                      Iconsax.note_14,
                      Iconsax.profile_2user,
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
