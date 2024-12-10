import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/custom_button.dart';
import 'package:mobologics_web/widgets/home_description_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          // For desktop view (width > 800)
          return SingleChildScrollView(
            // Main Page Column
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero section with the title and description
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
                              ),
                              SizedBox(height: height * 0.01), // Reduced space
                              HomeDescriptionText(),
                              SizedBox(height: height * 0.025), // Reduced space
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CustomButton(
                                  text: "Get a Quote",
                                  onTap: () {},
                                  height: height * 0.06,
                                  width: width * 0.141,
                                  color: redColor,
                                  icon: Icons.arrow_forward,
                                ),
                              ),
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
                              "assets/images/screen.png",
                              height: height * 0.8,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // About Us section
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
                                      text: "ABOUT ",
                                      style: GoogleFonts.poppins(
                                        color: whiteColor,
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold,
                                        height: 1,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "US",
                                      style: GoogleFonts.poppins(
                                        color: redColor,
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold,
                                        height: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.01), // Reduced space
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
                              "assets/images/screen.png",
                              height: height * 0.8,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          // For mobile view (width < 800)
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(color: bgColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image at the top
                  Center(
                    child: Image.asset(
                      "assets/images/screen.png",
                      height: height * 0.35,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Tagline
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "WE CREATE AND MARKET\n",
                          style: GoogleFonts.poppins(
                            color: whiteColor,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        TextSpan(
                          text: "MOBILE APPS",
                          style: GoogleFonts.poppins(
                            color: redColor,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Description
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Text(
                      "We are a dynamic technology company offering comprehensive solutions in mobile app development, web app development, graphic design, and digital marketing. Our expert team leverages cutting-edge tools and strategies to deliver high-quality, user-centric products that drive business growth and enhance brand presence in the digital landscape.",
                      style: GoogleFonts.poppins(
                        color: whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  // Get a Quote Button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        text: "Get a Quote",
                        onTap: () {},
                        height: height * 0.06,
                        width: width * 0.4,
                        color: redColor,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.1),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
