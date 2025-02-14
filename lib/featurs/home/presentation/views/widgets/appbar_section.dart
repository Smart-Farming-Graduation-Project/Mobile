
import 'package:flutter/material.dart';
import '../../../../../core/utils/responsive/widget_height.dart';
import 'custom_icon.dart';
import 'search_filter_bar.dart';

class AppbarSection extends StatefulWidget {
  const AppbarSection({
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
         SizedBox(height: widgetHeight(context: context, height: 34),),

        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(
                  'assets/images/home/profile.png',
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text1,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.text2,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),

              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Column(
              children: [
                const CustomNotificationIcon(),
                SizedBox(
                  height: widgetHeight(context: context, height: 30),
                )
              ],
            ),
          ],
        ),

        const SizedBox(
          height: 10,
        ),
        SearchBarf(),


      ],
    );
  }
}


