
import 'package:crop_guard/features/ecommerce/categories/presentation/views/category_screen.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/cubits/home_cubit.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/widgets/home_title_text.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/widgets/popular_section.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/widgets/search_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_app_bar.dart';
import 'filter_button.dart';
import 'offer_card.dart';
import 'text_section.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit()..getCategories(),
        child:  Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                const HomeAppBar(
                  userName: 'Noha Ahmed',
                ),
                const SearchBarFilter(),
                const TextSection(text: 'See All'),
                SizedBox(height: 100.h, child: const CategoryScreen()),
                const HomeTitleText(
                  title: 'Today\'s Offer',
                ),
                const OfferCard(),
                const FilterButton(
                  text: 'Popular',
                ),
                const PopularSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
