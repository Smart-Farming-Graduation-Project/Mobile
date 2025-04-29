
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../../../../core/theme/app_colors.dart';
class FilterButton extends StatelessWidget {
   const FilterButton({super.key, required this.text1});
  final String text1;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text1,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold,fontFamily: 'Poppins'),
            ),
            IconButton(onPressed: (){}, icon: const Icon( Symbols.instant_mix,color:AppColors.kPrimaryColor,
              size: 34,))
          ]
      ),
    );
  }
}