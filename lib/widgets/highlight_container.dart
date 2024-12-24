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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // Determine container size
    double containerWidth = mobileView == true ? width * 0.4 : width * 0.18;
    double containerHeight = mobileView == true
        ? height * 0.07
        : width > 600 && width < 800
            ? height * 0.065
            : height * 0.085;

    return AnimatedContainer(
      width: containerWidth,
      height: containerHeight,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: mobileView == true ? width * 0.028 : width * 0.015,
            fontWeight: FontWeight.w600,
            color: isActive ? bgColor : whiteColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
