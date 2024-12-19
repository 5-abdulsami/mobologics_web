import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/home_description_text.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 1;
    var height = MediaQuery.of(context).size.height * 1;
    return SizedBox(
      height: height,
      child: Row(
        children: [
          // Left section with the text and button
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                  left: width * 0.05,
                  top: height * 0.14), // Reduced top padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Align to the top
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "About ",
                          style: GoogleFonts.poppins(
                            color: whiteColor,
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        TextSpan(
                          text: "Us",
                          style: GoogleFonts.poppins(
                            color: blueColor,
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.03), // Reduced space
                  HomeDescriptionText(),
                  SizedBox(height: height * 0.025), // Reduced space
                ],
              ),
            ),
          ),
          // Right section with the image
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                  left: width * 0.05,
                  top: height * 0.001), // Reduced top padding
              child: Center(
                child: Image.asset(
                  "assets/images/mobile_app_development.png",
                  height: height * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
