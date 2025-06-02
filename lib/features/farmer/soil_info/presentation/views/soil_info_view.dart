import 'package:flutter/material.dart';

class SoilInfoView extends StatelessWidget {
  const SoilInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soil Information'),
      ),
      body: const Center(
        child: Text('Soil Information View'),
      ),
    );
  }
}
