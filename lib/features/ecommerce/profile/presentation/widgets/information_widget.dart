import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({super.key,});

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
                      getIt<CacheHelper>().getDataString(key: ApiKeys.profileImage)!,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text('${getIt<CacheHelper>().getDataString(key: ApiKeys.username)}',
                        style: AppTextStyles.font24.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      getIt<CacheHelper>().getDataString(key: ApiKeys.email)!,
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
