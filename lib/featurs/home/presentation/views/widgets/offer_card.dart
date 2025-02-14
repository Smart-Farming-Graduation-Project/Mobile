import 'package:crop_guard/core/utils/responsive/widget_width.dart';
import 'package:crop_guard/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/responsive/widget_height.dart';
import '../../models/offer_model.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:[
              Stack(
                  children: [
                    Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      offers[0].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                    Positioned(
                      bottom: 15,
                      left: 25,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.kPrimaryColor.withAlpha(200),
                          ),
                          width: widgetWidth(context: context, width: 90),
                          height: widgetHeight(context: context, height: 30),

                          child:
                          const Center(
                            child: Text(
                              'Shop Now',
                              style: TextStyle(color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),),
                          ),
                        ),
                      ),
                    )
                  ]

            )

       ,
                  ]),
  )
    );
  }
}
