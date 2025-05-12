import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
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
    final cubit = getIt<TermsAndConditionsCubit>();
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<TermsAndConditionsCubit, TermsAndConditionsState>(
        builder: (context, state) {
          return Row(
            children: [
              Checkbox(
                  value: cubit.isAccepted,
                  activeColor: AppColors.kPrimaryColor,
                  onChanged: (bool? value) {
                    cubit.toggleAcceptance();
                  }),
              Text(
                'I agree to the Terms & Conditions',
                style: AppTextStyles.font14BlackRegular,
              ),
            ],
          );
        },
      ),
    );
  }
}
