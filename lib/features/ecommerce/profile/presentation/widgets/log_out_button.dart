import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton(
      {super.key,
      required this.buttoncolor,
      required this.buttonwidth,
      required this.buttonheight,
      required this.buttontext,
      required this.textcolor});
  final Color buttoncolor;
  final double buttonwidth;
  final double buttonheight;
  final String buttontext;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: () {
            getIt<CacheHelper>().clearData();
            getIt<CacheHelper>().saveData(
              key: "isOnboardingVisited",
              value: true,
            );
            GoRouter.of(context).go(AppRouter.signIn);
          },
          child: Container(
              decoration: BoxDecoration(
                  color: buttoncolor, borderRadius: BorderRadius.circular(15)),
              width: buttonwidth,
              height: buttonheight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Icon(
                    Icons.logout,
                    color: textcolor,
                  ),
                  Text(buttontext,
                      style: TextStyle(
                        color: textcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              )),
        ));
  }
}
