import 'package:crop_guard/core/routing/app_router.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddressButton extends StatelessWidget {
  const AddressButton({
    super.key,
    required this.isAddressSelected,
  });
  final bool isAddressSelected;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (isAddressSelected) return;
          GoRouter.of(context).push(AppRouter.confirmDeliveryLocation);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: isAddressSelected
            ? const Text(
                'Proceed to Payment',
                style: TextStyle(color: AppColors.kWhiteColor, fontSize: 18),
              )
            : const Row(
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
