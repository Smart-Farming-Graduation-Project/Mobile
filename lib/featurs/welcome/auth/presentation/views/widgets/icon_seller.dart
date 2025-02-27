import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';

class IconSeller extends StatefulWidget {
  const IconSeller({super.key});

  @override
  State<IconSeller> createState() => _IconSellerState();
}

class _IconSellerState extends State<IconSeller> {

  Color containerColor2 = AppColors.kWhiteColor;
  Color personColor2 =  AppColors.kGrayColor;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black.withAlpha(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.person, size: 100
                  , color: personColor2),
              Positioned(
                bottom: 14,
                right: 10,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: containerColor2 ,
                ),
              ),
              Positioned(
                bottom: 14,
                right: 10,
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor:personColor2 ,
                  child:Icon( Icons.agriculture_outlined,
                      size: 20, color: containerColor2),
                ),
              ),
            ],
          ),
          Text('Seller',style: TextStyle(
            color: personColor2,
            fontSize: 18,
          ),)
        ],
      ),
    );
  }
}
