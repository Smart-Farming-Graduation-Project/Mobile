import 'package:flutter/material.dart';

import '../../../../../../core/utils/theme/app_colors.dart';
import '../sign_in.dart';

class GoToPage extends StatefulWidget {
  const GoToPage({super.key, required this.pageName});
  final String pageName;
  @override
  State<GoToPage> createState() => _GoToPageState();
}

class _GoToPageState extends State<GoToPage> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already Have An Acount ?'),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignIn();
                },
              ),
            );
          },
          child: Text(
            widget.pageName,
            style: const TextStyle(
              color: AppColors.kPrimaryColor,),
          ),
        )
      ],
    );
  }
}
