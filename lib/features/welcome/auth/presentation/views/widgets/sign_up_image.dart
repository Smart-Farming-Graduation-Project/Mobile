import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/register_cubit/register_cubit.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpImage extends StatelessWidget {
  const SignUpImage({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: () {
            cubit.pickUserImage();
          },
          child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return Container(
                width: 120.w,
                height: 120.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                  image: cubit.imageFile != null
                      ? DecorationImage(
                          image: FileImage(cubit.imageFile!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: cubit.imageFile != null
                    ? null
                    : Icon(
                        Icons.person,
                        size: 90.sp,
                        color: Colors.grey,
                      ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 5.h,
          ),
          decoration: const BoxDecoration(
            color: AppColors.kGreenColor,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
            onTap: () {
              cubit.pickUserImage();
            },
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
        ),
      ],
    );
  }
}
