import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddressSheetTitle extends StatelessWidget {
  const AddressSheetTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Select an Address",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.kGreenColor,
            child: CircleAvatar(
              radius: 13,
              backgroundColor: AppColors.kWhiteColor,
              child: Icon(
                Icons.close_rounded,
                color: AppColors.kGreenColor,
              ),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
