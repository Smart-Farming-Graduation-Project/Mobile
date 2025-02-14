import 'package:flutter/material.dart';
import 'appbar_section.dart';
import 'category_section.dart';
import 'filter_button.dart';
import 'offer_card.dart';
import 'recommended_section.dart';
import 'search_filter_bar.dart';
import 'text_section.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: AppbarSection(
              text1: 'Delivered to',
              text2: 'Noha Ahmed',
            ),
          ),
          const SliverToBoxAdapter(
            child: SearchBarf(),
          ),
          const SliverToBoxAdapter(
            child: TextSection(text1: 'Categories', text2: 'See all'),
          ),
          const SliverToBoxAdapter(
            child: CategoriesSection(axis:'horizontal',),
          ),
          const SliverToBoxAdapter(
            child: TextSection(text1: 'Today\'s Offer', text2: ''),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          const OfferCard(),

          SliverToBoxAdapter(
            child: FilterButton(text1: 'Popular',),
          ),

          const SliverToBoxAdapter(
            child: RecommendedSection(),
          ),
        ],
      ),
    );
  }
}

