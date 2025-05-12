import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/register_cubit/register_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'icon_buyer.dart';
import 'icon_seller.dart';

class RoleIcons extends StatelessWidget {
  const RoleIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                context.read<RegisterCubit>().chooseBuyer();
              },
              child: BuyerRole(
                isSelected: state is RegisterRoleSelectedState &&
                    state.selectedRole == 'Buyer',
              ),
            ),
            horizontalSpace(5),
            GestureDetector(
              onTap: () {
                context.read<RegisterCubit>().chooseFarmer();
              },
              child: FarmerRole(
                isSelected: state is RegisterRoleSelectedState &&
                    state.selectedRole == 'Farmer',
              ),
            ),
          ],
        );
      },
    );
  }
}
