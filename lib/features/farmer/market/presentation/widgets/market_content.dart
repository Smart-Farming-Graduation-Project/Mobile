import 'package:crop_guard/core/helper/build_app_bar.dart';
import 'package:crop_guard/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubits/market_cubit.dart';
import '../../../../ecommerce/home/presentation/widgets/search_filter_bar.dart';
import '../../../../ecommerce/categories/presentation/views/category_section.dart';
import '../../../../ecommerce/home/presentation/widgets/offer_card.dart';
import '../../../../ecommerce/home/presentation/widgets/filter_button.dart';
import '../../../../ecommerce/home/presentation/widgets/popular_section.dart';
import '../../../../ecommerce/home/presentation/widgets/home_title_text.dart';

class MarketContent extends StatelessWidget {
  const MarketContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) {
          final cubit = MarketCubit();
          return cubit;
        },
        child: Scaffold(
          appBar: buildAppBar(context, title: "Market"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10),
                const SearchBarFilter(),
                const Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: HomeTitleText(
                    title: 'Category',
                  ),
                ),
                SizedBox(height: 90.h, child: const CategorySection()),
                const HomeTitleText(
                  title: 'Today\'s Offer',
                ),
                verticalSpace(10),
                const OfferCard(),
                verticalSpace(10),
                const FilterButton(
                  text: 'Popular',
                ),
                verticalSpace(10),
                const PopularSection(),
                verticalSpace(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
