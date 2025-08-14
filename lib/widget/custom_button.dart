import 'package:buisness_chat/constants/strings.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.buttonName,required this.onTap});
  final String buttonName;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        width: 420,

        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
