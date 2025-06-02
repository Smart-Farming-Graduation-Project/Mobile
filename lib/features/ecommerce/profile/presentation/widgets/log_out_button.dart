import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton(
      {super.key,
      required this.buttoncolor,
      required this.buttonwidth,
      required this.buttonheight,
      required this.buttontext,
      required this.textcolor});
  final Color buttoncolor;
  final double buttonwidth;
  final double buttonheight;
  final String buttontext;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
            decoration: BoxDecoration(
                color: buttoncolor, borderRadius: BorderRadius.circular(15)),
            width: buttonwidth,
            height: buttonheight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Icon(
                  Icons.logout,
                  color: textcolor,
                ),
                Text(buttontext,
                    style: TextStyle(
                      color: textcolor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            )));
  }
}
