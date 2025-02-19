import 'package:flutter/material.dart';

import '../../../../core/utils/theme/app_colors.dart';

class TextBox1 extends StatefulWidget {
  const TextBox1({super.key, required this.name});
  final String name ;

  @override
  State<TextBox1> createState() => _TextBox1State();
}

class _TextBox1State extends State<TextBox1> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
<<<<<<< HEAD
      padding:  EdgeInsets.symmetric(horizontal: 20),
=======
      padding:  const EdgeInsets.symmetric(horizontal: 20),
>>>>>>> main
      child: TextField(
            decoration: InputDecoration(
              labelText: widget.name,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
<<<<<<< HEAD
                  borderSide: BorderSide(color: AppColors.kPrimaryColor)
=======
                  borderSide: const BorderSide(color: AppColors.kPrimaryColor)
>>>>>>> main
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: AppColors.kWhiteColor ,
              filled: true,
            ),


      ),
    );
  }
}
