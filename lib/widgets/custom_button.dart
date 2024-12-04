import 'package:flutter/material.dart';
import 'package:mobologics_web/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: 550),
        width: double.infinity,
        height: height * 0.07,
        decoration: BoxDecoration(
            color: blueColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style:
                TextStyle(color: whiteColor, fontSize: width > 600 ? 18 : 16),
          ),
        ),
      ),
    );
  }
}
