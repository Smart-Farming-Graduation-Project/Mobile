import 'package:crop_guard/core/utils/theme/app_colors.dart';
import 'package:crop_guard/featurs/cart/views/widgets/address_tile.dart';
import 'package:flutter/material.dart';

class SelectAddressSheet extends StatelessWidget {
  const SelectAddressSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.18,
      minChildSize: 0.18,
      maxChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
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
            ),
            const AddressTile(),
            const Divider(),
            SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}
