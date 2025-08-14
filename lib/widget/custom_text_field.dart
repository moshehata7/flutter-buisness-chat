import 'package:buisness_chat/constants/strings.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hintTxt, required this.secure,required this.onChanged});

  final String hintTxt;
  bool secure;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    validator: (data) {
        if ( data!.isEmpty) {
          return "Required";
        }
        
      },
      onChanged: onChanged,
      obscureText: secure,
      decoration: InputDecoration(
        hintText: hintTxt,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
