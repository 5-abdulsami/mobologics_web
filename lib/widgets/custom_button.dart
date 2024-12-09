import 'package:flutter/material.dart';
import 'package:mobologics_web/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color color;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.height,
      required this.width,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 550),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: whiteColor,
                fontSize: width > 600 ? 18 : 16,
                shadows: [
                  Shadow(
                      color: blackColor,
                      blurRadius: 1.6,
                      offset: Offset(0, 2.5)),
                ]),
          ),
        ),
      ),
    );
  }
}
