import 'package:flutter/material.dart';
import 'package:mobologics_web/utils/colors.dart';

class HighlightContainer extends StatelessWidget {
  final String text;
  final bool isActive;

  const HighlightContainer({
    required this.text,
    required this.isActive,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? bgColor : bgColor,
        border: Border.all(
          color: isActive ? blueColor : greyColor,
          width: isActive ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: blueColor.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 1,
                )
              ]
            : [],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isActive ? blueColor : greyColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
