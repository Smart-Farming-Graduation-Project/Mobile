import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/routing/app_router.dart';

void main() {
  runApp(const CropGaurd());


}

class CropGaurd extends StatelessWidget {
  const CropGaurd({super.key});

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
          title: 'CropGaurd',
          theme: ThemeData(
            primarySwatch: Colors.green,
            textTheme: GoogleFonts.robotoTextTheme(),
          ),
        );
      },
    );
  }
}
