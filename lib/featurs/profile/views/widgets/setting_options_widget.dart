import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../edit_profile.dart';

class SettingOptionsWidget extends StatefulWidget {
  const SettingOptionsWidget({super.key,
    required this.name, required this.iconName});
  final String name ;
  final  IconData iconName ;

  @override
  State<SettingOptionsWidget> createState() => _SettingOptionsWidgetState();
}

class _SettingOptionsWidgetState extends State<SettingOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
          ),
          child: Icon(widget.iconName,color: Colors.black,),
        ),
        const SizedBox(width: 10,),
         Text(widget.name,
            style: AppTextStyles.textStyle24.copyWith(fontWeight: FontWeight.bold)),
        const Spacer(flex: 1,),
        IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const EditProfile();
              },
            ),
          );
        },
            icon: const Icon(Icons.navigate_next,color: Colors.black,size: 35,))
      ],
    );
  }
}
