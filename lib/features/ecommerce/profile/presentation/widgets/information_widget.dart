import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/manger/models/profile_model.dart';
import 'package:flutter/material.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({super.key, required this.profile});
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(borderRadius: BorderRadius.only()),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      profile.profileImage,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text('${profile.firstName} ${profile.lastName}',
                        style: AppTextStyles.font24.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      profile.email,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
      ),
    );
  }
}
