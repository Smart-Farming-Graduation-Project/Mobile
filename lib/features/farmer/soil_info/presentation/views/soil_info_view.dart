import 'package:crop_guard/core/helper/build_app_bar.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/views/widgets/soil_info_loaded_view_body.dart';
import 'package:flutter/material.dart';

class SoilInfoView extends StatelessWidget {
  const SoilInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Soil Information'),
      body: const SoilInfoLoadedViewBody(),
    );
  }
}
