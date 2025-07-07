import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/manger/cubits/cubit/profile_cubit.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/manger/cubits/cubit/profile_state.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/profile_avatar.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'home_header_icons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.userName,
  });
  final String userName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h, top: 5.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            horizontalSpace(10),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileSuccessState) {
                  return ProfileAvatar(
                    imageUrl: state.profile.profileImage,
                  );
                } else if (state is ProfileErrorState) {
                  return const ProfileAvatar(imageUrl: "");
                } else if (state is ProfileLoadingState) {
                  return Skeletonizer(
                    child: CircleAvatar(
                      radius: 24.r,
                      backgroundColor: AppColors.kPrimaryColor,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileSuccessState) {
                      return UserInfo(
                        name:
                            "${state.profile.firstName} ${state.profile.lastName}",
                      );
                    } else if (state is ProfileErrorState) {
                      return const UserInfo(name: "unknown user");
                    } else if (state is ProfileLoadingState) {
                      return const Skeletonizer(
                          child: UserInfo(name: "unknown user"));
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            const HomeHeaderIcons(),
          ],
        ),
      ),
    );
  }
}
