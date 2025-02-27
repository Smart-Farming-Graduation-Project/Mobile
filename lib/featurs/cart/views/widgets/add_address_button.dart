import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 8,
            ),
            Icon(
              Icons.add_rounded,
              color: AppColors.kWhiteColor,
              size: 22,
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              "Add New Address",
              style: TextStyle(
                color: AppColors.kWhiteColor,
                fontSize: 18,
              ),
            ),
            Spacer(
              flex: 8,
            ),
          ],
        ),
      ),
    );
  }
}
