import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:crop_guard/core/widgets/button_decoration.dart';

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
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            getIt<CacheHelper>().getDataString(key: ApiKeys.profileImage)!,
                          ),
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
            TextBox1(
                name: 'Name',
                initialValue: getIt<CacheHelper>().getDataString(key: ApiKeys.username)!),
            const SizedBox(
              height: 15,
            ),
            TextBox1(name: 'Email Address', initialValue: getIt<CacheHelper>().getDataString(key: ApiKeys.email)!),
            const SizedBox(
              height: 15,
            ),
            TextBox1(name: 'Mobile Number', initialValue: getIt<CacheHelper>().getDataString(key: ApiKeys.profilePhone)!),
            const SizedBox(
              height: 15,
            ),
            TextBox1(name: 'Enter Address', initialValue: getIt<CacheHelper>().getDataString(key: ApiKeys.address)!),
            const SizedBox(
              height: 100,
            ),
            const ButtonDecoration(
                buttoncolor: AppColors.kPrimaryColor,
                buttonwidth: 50,
                buttonheight: 60,
                buttontext: 'Update',
                textcolor: AppColors.kWhiteColor),
          ],
        ),
      ),
    );
  }
}
