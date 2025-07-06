import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';

class SettingOptionsWidget extends StatelessWidget {
  const SettingOptionsWidget(
      {super.key, required this.name, required this.iconName, required this.onPressed});
  final String name;
  final IconData iconName;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              child: Row(
                children: [
                  const SizedBox(
                    width: 18,
                  ),
                  Icon(
                    iconName,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(name, style: AppTextStyles.font16BlackBold),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                  size: 35,
                ))
      ],
    );
  }
}
