import 'package:flutter/material.dart';

import 'appbar_section.dart';
import 'category_button.dart';
import 'category_section.dart';
import 'offer_card.dart';
import 'recommended_section.dart';
import 'search_filter_bar.dart';
import 'text_section.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: AppbarSection(
              text1: 'Delivered to',
              text2: 'Noha Ahmed',
            ),
          ),
          SliverToBoxAdapter(
            child: SearchBarf(),
          ),
          SliverToBoxAdapter(
            child: TextSection(text1: 'Categories', text2: 'See all'),
          ),
          SliverToBoxAdapter(
            child: CategoriesSection(),
          ),
          SliverToBoxAdapter(
            child: TextSection(text1: 'Today\'s Offer', text2: ''),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          OfferCard(),
          SliverToBoxAdapter(
            child:  TextSection(text1: 'Recommended for you', text2: ''),
          ),
          SliverToBoxAdapter(
            child: CategorySelection(),
          ),
          SliverToBoxAdapter(
            child: RecommendedSection(),
          ),
        ],
      ),
    );
  }
}

