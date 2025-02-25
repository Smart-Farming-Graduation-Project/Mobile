import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/utils/theme/app_colors.dart';

class FGIcons extends StatefulWidget {
  const FGIcons({super.key});

  @override
  State<FGIcons> createState() => _FGIconsState();
}

class _FGIconsState extends State<FGIcons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          borderRadius:  BorderRadius.circular(8),
          splashColor: AppColors.kGrayColor,
          child: Container(
            padding: const EdgeInsets.all(12),
            child:  Icon(
              FontAwesomeIcons.facebook,
              color: Colors.blue,
              size: 50,
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          splashColor: AppColors.kGrayColor,
          child: Container(
            padding:  EdgeInsets.all(12),
            child: Icon(
              FontAwesomeIcons.google,
              color: AppColors.kGrayColor,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
