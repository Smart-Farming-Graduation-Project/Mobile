
import 'package:flutter/material.dart';
import '../../../../../../core/utils/theme/app_colors.dart';
class CustomTextFormField extends StatefulWidget {
   CustomTextFormField({
    super.key, required this.Name, required this.Iconname,
     this.Iconvisible, required this.obsscureText
  });
final String Name ;
final  IconData Iconname ;
final bool obsscureText ;
IconData? Iconvisible ;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText:widget.obsscureText ,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.Iconname),
        suffixIcon: Icon(widget.Iconvisible ),
        hintText: widget.Name,
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        ),
        fillColor: Color(0xffD6D6D6),
        filled: true,

      )
    );
  }
}