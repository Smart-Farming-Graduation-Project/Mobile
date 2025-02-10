
import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.text1, required this.text2,  });
final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child:  Text(
              text2 ,
              style: const TextStyle(color: Colors.green, fontSize: 20,fontWeight: FontWeight.bold),))
      ]
      ),
    );
  }
}
