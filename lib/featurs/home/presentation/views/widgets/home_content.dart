import 'package:crop_guard/featurs/categories/manger/cubit/category_cubit.dart';
import 'package:crop_guard/featurs/categories/manger/cubit/product_cubit.dart';
import 'package:crop_guard/featurs/categories/presentation/views/category_screen.dart';
import 'package:crop_guard/featurs/home/manger/cubit/home_cubit.dart';
import 'package:crop_guard/featurs/home/presentation/views/widgets/search_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'appbar_section.dart';
import 'filter_button.dart';
import 'offer_card.dart';
import 'recommended_section.dart';
import 'text_section.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
    providers: [
    BlocProvider(create: (context) => HomeCubit()),
    BlocProvider(create: (context) => CategoryCubit()),
    BlocProvider(create: (context) => ProductCubit()),
    ],
   child:


    const SafeArea(
        child:  Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric( horizontal: 15),
            child: Column(
              children: [
                AppbarSection( userName: 'Noha Ahmed',),
                SearchBarFilter(),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(height: 12),
                      ),
                      SliverToBoxAdapter(
                        child:TextSection(text1: 'Categories', text2: 'See All'),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(height: 10),
                      ),
                      SliverToBoxAdapter(
                        child:  SizedBox(
                            height: 100,
                            child: CategoryScreen()),
                      ),

                      SliverToBoxAdapter(
                        child: TextSection(text1: 'Today\'s Offer', text2: ''),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(height: 10),
                      ),
                      OfferCard(),
                      SliverToBoxAdapter(
                        child: FilterButton(
                          text1: 'Popular',
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: RecommendedSection(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
  }
}