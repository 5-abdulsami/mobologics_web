import 'package:flutter/material.dart';
import 'package:mobologics_web/utils/colors.dart';

class HighlightContainer extends StatelessWidget {
  final String text;
  final bool isActive;
  final bool? mobileView;

  const HighlightContainer({
    required this.text,
    required this.isActive,
    this.mobileView = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 1;
    return AnimatedContainer(
      constraints: BoxConstraints(
        minWidth: mobileView == true ? width * 0.42 : width * 0.18,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? whiteColor : bgColor,
        border: Border.all(
          color: isActive ? whiteColor : greyColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: blueColor.withOpacity(0.5),
                  blurRadius: 5,
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
          color: isActive ? bgColor : whiteColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
