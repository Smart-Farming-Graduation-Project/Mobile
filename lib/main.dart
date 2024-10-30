import 'package:crop_pilot/featurs/welcome/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CropPilot());
}

class CropPilot extends StatelessWidget {
  const CropPilot({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CropPilot',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
