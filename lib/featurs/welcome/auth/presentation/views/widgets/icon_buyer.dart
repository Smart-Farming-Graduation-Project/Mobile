import 'package:flutter/material.dart';
import '../../../../../../core/utils/theme/app_colors.dart';

class IconBuyer extends StatefulWidget {
  const IconBuyer({super.key});

  @override
  State<IconBuyer> createState() => _IconBuyerState();
}

class _IconBuyerState extends State<IconBuyer> {
  Color containerColor1 = AppColors.kWhiteColor;
  Color personColor1 =  AppColors.kGrayColor;
  Color containerColor2 = AppColors.kWhiteColor;
  Color personColor2 =  AppColors.kGrayColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: containerColor1,
      ),
      child:Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.person, size: 100
                  , color: personColor1),
              Positioned(
                bottom: 14,
                right: 10,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: containerColor1 ,
                ),
              ),
              Positioned(
                bottom: 14,
                right: 10,
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor:personColor1 ,
                  child:Icon(Icons.shopping_cart_outlined,
                      size: 20, color: containerColor1),
                ),
              ),
            ],
          ),
          Text('Buyer',style: TextStyle(
            color: personColor1,
            fontSize: 18,
          ),)
        ],
      ),
    );
  }
}
