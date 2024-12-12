import 'package:flutter/material.dart';
import 'package:mobologics_web/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color color;
  final IconData? icon;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.height,
      required this.width,
      required this.color,
      this.icon});

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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style:
                    const TextStyle(color: whiteColor, fontSize: 23, shadows: [
                  Shadow(
                      color: blackColor,
                      blurRadius: 1.8,
                      offset: Offset(0, 2.5)),
                ]),
              ),
              SizedBox(
                width: width * 0.080,
              ),
              Icon(
                icon,
                color: whiteColor,
                size: 25,
                shadows: const [
                  Shadow(
                      color: blackColor,
                      blurRadius: 1.8,
                      offset: Offset(0, 2.5)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
