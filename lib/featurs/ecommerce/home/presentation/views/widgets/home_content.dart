import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/manger/category_cubit/product_cubit.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/views/category_screen.dart';
import 'package:crop_guard/featurs/ecommerce/favorite/manger/cubit/favorite_cubit.dart';
import 'package:crop_guard/featurs/ecommerce/home/manger/cubit/home_cubit.dart';
import 'package:crop_guard/featurs/ecommerce/home/presentation/views/widgets/popular_section.dart';
import 'package:crop_guard/featurs/ecommerce/home/presentation/views/widgets/search_filter_bar.dart';
import 'package:crop_guard/featurs/ecommerce/reviews/presentation/manger/helper/review_service.dart';
import 'package:crop_guard/featurs/ecommerce/reviews/presentation/manger/review_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'appbar_section.dart';
import 'filter_button.dart';
import 'offer_card.dart';
import 'text_section.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..getCategories()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(
          create: (context) => ReviewCubit(getIt<ApiService>()),
        ),
        BlocProvider(
          create: (_) => FavoriteCubit(
          ),

        )

      ],
      child: const SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Expanded(
              child: Column(
                spacing: 4,
                children: [
                  AppbarSection(
                    userName: 'Noha Ahmed',
                  ),
                  SearchBarFilter(),
                  TextSection(text1: 'Categories', text2: 'See All'),
                  SizedBox(height: 100, child: CategoryScreen()),
                  TextSection(text1: 'Today\'s Offer', text2: ''),
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
      ),
    );
  }
}
