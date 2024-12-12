import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';

class Tagline extends StatelessWidget {
  const Tagline({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "WE CREATE AND MARKET\n",
            style: GoogleFonts.poppins(
              color: whiteColor,
              fontSize: 70,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          TextSpan(
            text: "MOBILE APPS",
            style: GoogleFonts.poppins(
              color: redColor,
              fontSize: 70,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
