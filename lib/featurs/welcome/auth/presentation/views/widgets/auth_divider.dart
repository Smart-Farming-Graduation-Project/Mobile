import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        Text('Or'),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
