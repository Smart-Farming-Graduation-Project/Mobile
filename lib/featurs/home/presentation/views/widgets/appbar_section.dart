
import 'package:flutter/material.dart';
import '../../../../../core/utils/responsive/widget_height.dart';
import 'custom_icon.dart';

class AppbarSection extends StatefulWidget {
  AppbarSection({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;

  @override
  State<AppbarSection> createState() => _AppbarSectionState();
}

class _AppbarSectionState extends State<AppbarSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),

        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(
                  'assets/images/home/profile.png',
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text1,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.text2,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Column(
              children: [
                CustomNotificationIcon(),
                SizedBox(
                  height: widgetHeight(context: context, height: 30),
                )
              ],
            )
          ],
        ),


      ],
    );
  }
}


