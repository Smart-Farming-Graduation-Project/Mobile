import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';

class FarmerRole extends StatelessWidget {
  final bool isSelected;

  const FarmerRole({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final Color containerColor = isSelected ? AppColors.kPrimaryColor : AppColors.kWhiteColor;
    final Color personColor = isSelected ? AppColors.kWhiteColor : AppColors.kGrayColor;

    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
          color: isSelected ? AppColors.kPrimaryColor : Colors.black.withAlpha(15),
        boxShadow: isSelected ? [const BoxShadow(color: Colors.black26, blurRadius: 5)] : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.person, size: 100, color: personColor),
              Positioned(
                bottom: 14,
                right: 10,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor:containerColor,

                child: CircleAvatar(
                  radius: 15,
                  backgroundColor:personColor ,
                  child:  Icon(Icons.agriculture_outlined, size: 20,  color:containerColor),
                ),
              ),
              )],
          ),
          Text('Farmer', style: TextStyle(color:personColor , fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
