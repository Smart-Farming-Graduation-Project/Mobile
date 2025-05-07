import 'package:crop_guard/featurs/ecommerce/categories/presentation/views/category_screen.dart';
import 'package:crop_guard/featurs/ecommerce/home/manger/cubit/home_cubit.dart';
import 'package:crop_guard/featurs/ecommerce/home/presentation/views/widgets/popular_section.dart';
import 'package:crop_guard/featurs/ecommerce/home/presentation/views/widgets/search_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        child: const Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                HomeAppBar(
                  userName: 'Noha Ahmed',
                ),
                SearchBarFilter(),
                TextSection(text2: 'See All'),
                SizedBox(height: 100, child: CategoryScreen()),
                HomeTitleText(
                  text1: 'Today\'s Offer',
                ),
                OfferCard(),
                FilterButton(
                  text1: 'Popular',
                ),
                PopularSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
