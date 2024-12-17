import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/home_description_text.dart';

class MobileAboutUsSection extends StatelessWidget {
  final double height;
  final double width;
  const MobileAboutUsSection(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "ABOUT ",
                  style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                TextSpan(
                  text: "US",
                  style: GoogleFonts.poppins(
                    color: redColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
              ]),
            ),
            SizedBox(height: height * 0.02),
            HomeDescriptionText(isMobile: true),
            SizedBox(height: height * 0.04),
            Center(
              child: Image.asset(
                "assets/images/mobile_app_development.png",
                height: height * 0.35,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
