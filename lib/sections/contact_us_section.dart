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
    final isMobile = width < 600;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: isMobile ? null : height,
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height * 0.06),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Got a Quote in\n",
                                  style: GoogleFonts.poppins(
                                    color: whiteColor,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                    height: 1,
                                  ),
                                ),
                                TextSpan(
                                  text: "mind?",
                                  style: GoogleFonts.poppins(
                                    color: blueColor,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          "Let's connect! Whether you have a query, feedback, or a business proposal, we're ready to listen. Get in touch with us today. Our team is dedicated to providing exceptional customer service and innovative solutions.",
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: whiteColor),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: height * 0.05),
                        ContactForm(
                            width: width, height: height, isMobile: isMobile),
                      ],
                    )
                  : Row(
                      children: [
                        // Left section with the text
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: height * 0.08,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Got a Quote in\n",
                                        style: GoogleFonts.poppins(
                                          color: whiteColor,
                                          fontSize: 70,
                                          fontWeight: FontWeight.bold,
                                          height: 1,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "mind?",
                                        style: GoogleFonts.poppins(
                                          color: blueColor,
                                          fontSize: 70,
                                          fontWeight: FontWeight.bold,
                                          height: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.035,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: Text(
                                    "Let's connect! Whether you have a query, feedback, or a business proposal, we're ready to listen. Get in touch with us today. Our team is dedicated to providing exceptional customer service and innovative solutions.",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16, color: whiteColor),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Right section with the form
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.08,
                              ),
                              ContactForm(
                                  width: width,
                                  height: height,
                                  isMobile: isMobile),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
