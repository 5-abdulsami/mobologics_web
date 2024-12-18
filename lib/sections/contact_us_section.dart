import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/contact_form.dart';

class ContactUsSection extends StatelessWidget {
  const ContactUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
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
                      mainAxisAlignment:
                          MainAxisAlignment.start, // Align to the top
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Got a Quote in\n",
                                style: GoogleFonts.poppins(
                                  color: whiteColor,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                              TextSpan(
                                text: "mind?",
                                style: GoogleFonts.poppins(
                                  color: blueColor,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Right section with the image
                Expanded(
                    flex: 1, child: ContactForm(width: width, height: height)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
