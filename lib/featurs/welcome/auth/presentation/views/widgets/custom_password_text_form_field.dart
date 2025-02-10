
import 'package:flutter/material.dart';
class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({
    super.key,
  });

  @override
  State<CustomPasswordTextFormField> createState() => _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState extends State<CustomPasswordTextFormField> {
  TextEditingController password = TextEditingController() ;
  bool visibility = false ;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: password,
        obscureText:!visibility ,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: InkWell(
            onTap: () =>
                setState( () => visibility = !visibility,


            ),
            child: Icon( visibility ?
                Icons.visibility_outlined : Icons.visibility_off_outlined ),
          ),

          hintText: 'password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          fillColor: const Color(0xffD6D6D6),
          filled: true,

        )
    );
  }}