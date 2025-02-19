import 'package:crop_guard/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            offset: const Offset(0, 5),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 1.4,
            child: Radio(
              value: 0,
              groupValue: 0,
              activeColor: AppColors.kPrimaryColor,
              focusColor: AppColors.kPrimaryColor,
              splashRadius: 2,
              onChanged: (int? value) {},
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "2118 Thornridge St. Syracuse, NY 13210 Sharkia, Egypt",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 14, color: AppColors.kBlackColor),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.navigate_next,
              color: AppColors.kBlackColor,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
