import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';

class Tagline extends StatelessWidget {
  final double fontSize;
  const Tagline({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "WE CREATE AND MARKET\n",
            style: GoogleFonts.poppins(
              color: whiteColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          TextSpan(
            text: "MOBILE APPS",
            style: GoogleFonts.poppins(
              color: redColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
