import 'package:crop_guard/featurs/favorite/presentation/views/fav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../categories/presentation/views/category_screen.dart';
import '../../manger/cubit/home_cubit.dart';
import 'widgets/home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, int>(
        builder: (context, selectedIndex) {
          final List<Widget> pages = [
            const HomeContent(),
            const CategoryScreen(),
            const FavScreen(),
            const Center(child: Text("Orders")),
            const Center(child: Text("Profile")),
          ];

          return Scaffold(
            body: pages[selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                context.read<HomeCubit>().changePage(index);
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.kPrimaryColor,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: "Category"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorites"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt), label: "Orders"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ],
            ),
          );
        },
      ),
    );
  }
}
