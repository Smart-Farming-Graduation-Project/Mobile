import 'package:crop_pilot/core/utils/responsive/widget_height.dart';
import 'package:crop_pilot/core/utils/responsive/widget_width.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        width: widgetWidth(context: context, width: 280),
        height: widgetHeight(context: context, height: 280),
      )
      

    );
  }
}