import 'package:crop_pilot/core/utils/Routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CropPilot());
}

class CropPilot extends StatelessWidget {
  const CropPilot({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          title: 'CropPilot',
          theme: ThemeData(
            textTheme: GoogleFonts.interTextTheme(),
          ),
        );
      },
    );
  }
}
