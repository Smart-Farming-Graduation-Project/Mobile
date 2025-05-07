import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CropGaurd());
}

class CropGaurd extends StatelessWidget {
  const CropGaurd({super.key});

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
          title: 'CropGuard',
          theme: ThemeData(
            primaryColor: AppColors.kPrimaryColor,
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
        );
      },
    );
  }
}
