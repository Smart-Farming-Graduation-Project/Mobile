import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/helper/show_error_message.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/helper/show_success_message.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/manger/cubits/cubit/edit_profile_cubit_dart_cubit.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/manger/cubits/cubit/edit_profile_cubit_dart_state.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/name_text_form_field.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/phone_number_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:crop_guard/core/widgets/button_decoration.dart';
import 'package:go_router/go_router.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView(
          children: [
            const Center(
                child: Text(
              'Edit Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'popalin',
              ),
            )),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Form(
                  key: context.read<EditProfileCubit>().formKey,
                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child:
                              BlocBuilder<EditProfileCubit, EditProfileState>(
                            builder: (context, state) {
                              if (state is ImagePickedSuccessState) {
                                return CircleAvatar(
                                  radius: 60,
                                  backgroundImage: FileImage(context
                                      .read<EditProfileCubit>()
                                      .imageFile!),
                                );
                              }
                              return CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                  getIt<CacheHelper>().getDataString(
                                      key: ApiKeys.profileImage)!,
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: AppColors.kWhiteColor),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color: AppColors.kPrimaryColor),
                            child: const Icon(
                              FontAwesomeIcons.pen,
                              color: AppColors.kWhiteColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
            NameTextFormField(
                controller:
                    context.read<EditProfileCubit>().firstNameController,
                labelText: 'First Name'),
            const SizedBox(
              height: 15,
            ),
            NameTextFormField(
                controller: context.read<EditProfileCubit>().lastNameController,
                labelText: 'Last Name'),
            const SizedBox(
              height: 15,
            ),
            PhoneNumberTextFormField(
              controller: context.read<EditProfileCubit>().phoneController,
            ),
            const SizedBox(
              height: 15,
            ),
            NameTextFormField(
                controller: context.read<EditProfileCubit>().addressController,
                labelText: 'Address'),
            const SizedBox(
              height: 100,
            ),
            BlocConsumer<EditProfileCubit, EditProfileState>(
              listener: (context, state) {
                if (state is EditProfileSuccessState) {
                  showSuccessMessage(context, 'Profile updated successfully');
                  GoRouter.of(context).pop();
                } else if (state is EditProfileErrorState) {
                  showErrorMessage(context, state.errorMessage);
                }
              },
              builder: (context, state) {
                if (state is EditProfileLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.kPrimaryColor,
                    ),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    context.read<EditProfileCubit>().updateProfile();
                  },
                  child: const ButtonDecoration(
                      buttoncolor: AppColors.kPrimaryColor,
                      buttonwidth: 50,
                      buttonheight: 60,
                      buttontext: 'Update',
                      textcolor: AppColors.kWhiteColor),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
