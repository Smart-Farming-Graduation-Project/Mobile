import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/ecommerce/cart/manger/address_sheet_cubit/address_sheet_cubit.dart';
import 'package:crop_guard/featurs/ecommerce/cart/manger/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressTile extends StatelessWidget {
  const AddressTile(
      {super.key,
      required this.address,
      required this.isSelected,
      required this.addressIndex});
  final AddressModel address;
  final bool isSelected;
  final int addressIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            offset: const Offset(0, 0),
            spreadRadius: 2,
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
              value: isSelected ? 0 : 1,
              groupValue: 0,
              activeColor: AppColors.kPrimaryColor,
              focusColor: AppColors.kPrimaryColor,
              splashRadius: 2,
              onChanged: (int? value) {
                if (value == 0) {
                  context.read<AddressSheetCubit>().selectAddress(-1);
                } else {
                  context.read<AddressSheetCubit>().selectAddress(addressIndex);
                }
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.addressTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    address.addressDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.kBlackColor.withValues(alpha: 0.8)),
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
