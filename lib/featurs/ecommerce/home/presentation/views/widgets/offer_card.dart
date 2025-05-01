import 'package:flutter/material.dart';
import '../../models/offer_model.dart';
import '../../../../../../core/widgets/custom_button.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  const Positioned(
                    bottom: 15,
                    left: 25,
                    child:CustomButton( text: 'Shop Now',),
                      ),


                ]

          )

     ,
                ]),
      );
  }
}
