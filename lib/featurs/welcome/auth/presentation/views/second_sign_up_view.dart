import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/register_cubit/register_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_button.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_title.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/crop_guard_logo.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/name_text_form_field.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/phone_number_text_form_field.dart';
import 'package:flutter/material.dart';

class SecondSignUpView extends StatelessWidget {
  const SecondSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<RegisterCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Form(
          key: cubit.formKeySecondPage,
          child: ListView(
            children: [
              const CropGuardLogo(),
              const AuthTitle(
                title: 'Finish Sign Up',
              ),
              NameTextFormField(
                controller: cubit.firstNameController,
                labelText: 'First Name',
              ),
              const SizedBox(
                height: 15,
              ),
              NameTextFormField(
                controller: cubit.lastNameController,
                labelText: 'Last Name',
              ),
              const SizedBox(height: 15),
              PhoneNumberTextFormField(
                controller: cubit.phoneController,
              ),

              // const TermsAndConditions(),
              const SizedBox(height: 15),
              AuthButton(
                text: 'Sign Up',
                onTap: () {
                  cubit.signUp(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
