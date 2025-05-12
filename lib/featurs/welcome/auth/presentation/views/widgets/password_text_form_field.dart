import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/helper/is_valid_passward.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/password_cubit.dart/password_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/password_cubit.dart/password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    this.isConfirm = false,
    required this.passwordController,
    this.confirmPasswordController,
  });

  final bool isConfirm;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordCubit(),
      child: BlocBuilder<PasswordCubit, PasswordState>(
        builder: (context, state) {
          return TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColors.kPrimaryColor,
              ),
              labelText: isConfirm ? 'Confirm Password' : 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  isConfirm
                      ? (state.isConfirmPasswordObscure
                          ? Icons.visibility
                          : Icons.visibility_off)
                      : (state.isPasswordObscure
                          ? Icons.visibility
                          : Icons.visibility_off),
                  color: AppColors.kPrimaryColor,
                ),
                onPressed: () {
                  if (isConfirm) {
                    context
                        .read<PasswordCubit>()
                        .toggleConfirmPasswordVisibility();
                  } else {
                    context.read<PasswordCubit>().togglePasswordVisibility();
                  }
                },
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.kPrimaryColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            obscureText: isConfirm
                ? state.isConfirmPasswordObscure
                : state.isPasswordObscure,
            controller:
                isConfirm ? confirmPasswordController : passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password is required';
              }
              if (!isConfirm) {
                return isValidPassword(passwordController.text);
              } else {
                if (confirmPasswordController?.text !=
                    passwordController.text) {
                  return "Passwords do not match.";
                }
                return null;
              }
            },
          );
        },
      ),
    );
  }
}
