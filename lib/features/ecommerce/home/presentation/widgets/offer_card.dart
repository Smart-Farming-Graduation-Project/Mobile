import 'package:carousel_slider/carousel_slider.dart';
import 'package:crop_guard/features/ecommerce/home/data/models/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/custom_button.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160.h,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        autoPlayInterval: const Duration(seconds: 3), // Time between slides
        autoPlayAnimationDuration:
            const Duration(milliseconds: 1200), // Slide transition speed
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: offers.map((offer) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      offer.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 15,
                  left: 25,
                  child: CustomButton(text: 'Shop Now'),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
