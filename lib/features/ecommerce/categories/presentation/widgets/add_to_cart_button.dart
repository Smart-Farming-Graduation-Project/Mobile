import 'package:crop_guard/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:crop_guard/core/theme/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_shopping_cart_rounded,
                color: Colors.white, size: 20),
            horizontalSpace(10),
            const Text("Add To Cart",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
