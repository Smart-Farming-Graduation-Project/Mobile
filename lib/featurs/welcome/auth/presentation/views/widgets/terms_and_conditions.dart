import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/terms_conditions_cubit/terms_and_conditions_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/terms_conditions_cubit/terms_and_conditions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermsAndConditionsCubit(),
      child: BlocBuilder<TermsAndConditionsCubit, TermsAndConditionsState>(
        builder: (context, state) {
          return Row(
            children: [
              Checkbox(
                  value: state.isAccepted,
                  activeColor: AppColors.kPrimaryColor,
                  onChanged: (bool? value) {
                    context.read<TermsAndConditionsCubit>().toggleAcceptance();
                  }),
              const Text('I agree to the Terms & Conditions'),
            ],
          );
        },
      ),
    );
  }
}
