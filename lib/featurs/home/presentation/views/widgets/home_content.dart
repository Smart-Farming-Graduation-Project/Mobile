import 'package:crop_guard/featurs/home/presentation/views/widgets/search_filter_bar.dart';
import 'package:flutter/material.dart';
import 'appbar_section.dart';
import 'filter_button.dart';
import 'offer_card.dart';
import 'recommended_section.dart';
import 'text_section.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return
      const SafeArea(
        child:  Scaffold(
          body: Padding(
          padding: EdgeInsets.symmetric( horizontal: 20),
          child: Column(
            children: [
             AppbarSection( userName: 'Noha Ahmed',),
              SearchBarFilter(),
              Expanded(
                child: CustomScrollView(
                  slivers: [
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
      );
  }
}
