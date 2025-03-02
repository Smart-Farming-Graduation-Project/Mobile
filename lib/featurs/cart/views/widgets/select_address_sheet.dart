import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/cart/manger/address_sheet_cubit/address_sheet_cubit.dart';
import 'package:crop_guard/featurs/cart/manger/address_sheet_cubit/address_sheet_state.dart';
import 'package:crop_guard/featurs/cart/views/widgets/add_address_button.dart';
import 'package:crop_guard/featurs/cart/views/widgets/address_sheet_title.dart';
import 'package:crop_guard/featurs/cart/views/widgets/address_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectAddressSheet extends StatelessWidget {
  const SelectAddressSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.45,
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
            const AddressSheetTitle(),
            const Divider(),
            Expanded(
              child: BlocBuilder<AddressSheetCubit, AddressSheetState>(
                  builder: (context, state) {
                if (state is AddressSheetLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AddressSavedEmptyState) {
                  return const Center(child: Text("No saved address found"));
                } else if (state is AddressSavedState) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          itemCount: state.addresses.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 12,
                          ),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              context
                                  .read<AddressSheetCubit>()
                                  .selectAddress(index);
                            },
                            child: AddressTile(
                              address: state.addresses[index],
                              isSelected: state.addressIndex == index,
                              addressIndex: index,
                            ),
                          ),
                        ),
                      ),
                      state.addressIndex == -1
                          ? const AddressButton(
                              isAddressSelected: false,
                            )
                          : const AddressButton(
                              isAddressSelected: true,
                            ),
                    ],
                  );
                } else {
                  return const Center(child: Text("Something went wrong"));
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
