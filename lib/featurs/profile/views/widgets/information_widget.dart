

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/theme/app_text_styles.dart';

class InformationWidget extends StatefulWidget {
  const InformationWidget({super.key});

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )
      ),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
              children:[
                SizedBox(
                  height: 100,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
<<<<<<< HEAD
                    child: Image(image: AssetImage('assets/images/home/profile.png')),
=======
                    child: const Image(image: AssetImage('assets/images/home/profile.png')),
>>>>>>> main
                  ),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColors.kWhiteColor),

                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: AppColors.kPrimaryColor),
<<<<<<< HEAD
                    child: Icon(FontAwesomeIcons.pen,
=======
                    child: const Icon(FontAwesomeIcons.pen,
>>>>>>> main
                      color: AppColors.kWhiteColor,
                      size: 20,),
                  ),
                ),
              ]

          ),
<<<<<<< HEAD
          SizedBox(width: 20,),
=======
          const SizedBox(width: 20,),
>>>>>>> main
          Column(
            children: [
              Text('Menna Fouda',style: AppTextStyles.textStyle24.copyWith(
                  fontWeight: FontWeight.bold,color: AppColors.kWhiteColor)
              ),
              Text('mennafouda@gmail.com',style: AppTextStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,color: AppColors.kWhiteColor),)
            ],
          ),


        ],
      ),
    );
  }
}
