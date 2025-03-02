import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manger/cubit/account_cubit.dart';
import '../../../manger/cubit/account_cubit_state.dart';
import 'icon_buyer.dart';
import 'icon_seller.dart';

class RoleIcons extends StatelessWidget {
  const RoleIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                context.read<AccountCubit>().chooseBuyer();
              },
              child: BuyerRole(
                isSelected: state is BuyerState,
              ),
            ),

            GestureDetector(
              onTap: () {
                context.read<AccountCubit>().chooseSeller();
              },
              child: FarmerRole(
                isSelected: state is FarmerState,
              ),
            ),
          ],
        );
      },
    );
  }
}
