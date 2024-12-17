import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color color;
  final IconData? icon;
  final double fontSize;
  final double? iconSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.height,
    required this.width,
    required this.color,
    this.icon,
    required this.fontSize,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 550),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                  color: whiteColor,
                  fontSize: fontSize,
                  shadows: [
                    const Shadow(
                      color: blackColor,
                      blurRadius: 1.8,
                      offset: Offset(0, 2.5),
                    ),
                  ],
                ),
              ),
              // when icon is not null, insert the widgets in this list into the widget tree
              if (icon != null) ...[
                SizedBox(
                  width: width * 0.08, // Space between text and icon
                ),
                Icon(
                  icon,
                  color: whiteColor,
                  size: iconSize,
                  shadows: const [
                    Shadow(
                      color: blackColor,
                      blurRadius: 1.8,
                      offset: Offset(0, 2.5),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
