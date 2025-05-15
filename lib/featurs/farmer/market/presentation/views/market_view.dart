import 'package:flutter/material.dart';

class MarketView extends StatelessWidget {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market'),
      ),
      body: const Center(
        child: Text('Market View'),
      ),
    );
  }
}
