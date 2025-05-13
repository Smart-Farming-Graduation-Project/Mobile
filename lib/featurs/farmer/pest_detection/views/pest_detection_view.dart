import 'package:crop_guard/core/helper/build_app_bar.dart';
import 'package:crop_guard/featurs/farmer/pest_detection/views/widgets/initial_pest_detection.dart';
import 'package:flutter/material.dart';

class PestDetectionView extends StatelessWidget {
  const PestDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Pest Detection'),
      body: const InitialPestDetection(),
    );
  }
}
