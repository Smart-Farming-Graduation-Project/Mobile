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
      Scaffold(
        appBar:  PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child:AppbarSection(
            text1: 'Delivered to',
            text2: 'Noha Ahmed',
          ),
        ),
        body: Padding(
        padding: EdgeInsets.all(20),
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
      );
  }
}
