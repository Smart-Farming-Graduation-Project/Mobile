import 'package:crop_guard/core/responsive/widget_width.dart';
import 'package:flutter/material.dart';
import 'package:crop_guard/core/theme/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetWidth(context: context, width: 150),
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Row(
          children: [
            Icon(Icons.add_shopping_cart_rounded,
                color: Colors.white, size: 20),
            SizedBox(width: 10),
            Text("Add To Cart",
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
