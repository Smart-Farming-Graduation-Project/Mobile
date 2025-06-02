import 'package:flutter/material.dart';

class RoverControlView extends StatelessWidget {
  const RoverControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rover Control'),
      ),
      body: const Center(
        child: Text('Rover Control View'),
      ),
    );
  }
}
