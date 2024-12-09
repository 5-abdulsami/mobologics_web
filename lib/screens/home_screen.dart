import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero section with the title and description
          Container(
            decoration: BoxDecoration(color: bgColor),
            height: height,
            child: Row(
              children: [
                // Left section with the text and button
                Expanded(
                  flex: width > 800
                      ? 1
                      : 0, // More space on desktop, less on mobile
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "WE CREATE AND MARKET\n",
                              style: GoogleFonts.poppins(
                                color: whiteColor,
                                fontSize: width > 800 ? 70 : 45,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ),
                            ),
                            TextSpan(
                              text: "MOBILE APPS",
                              style: GoogleFonts.poppins(
                                color: redColor,
                                fontSize: width > 800 ? 70 : 45,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          "We are a dynamic technology company offering comprehensive solutions in mobile app development, web app development, graphic design, and digital marketing. Our expert team leverages cutting-edge tools and strategies to deliver high-quality, user-centric products that drive business growth and enhance brand presence in the digital landscape.",
                          style: GoogleFonts.poppins(
                            color: whiteColor,
                            fontSize: width > 800 ? 17 : 14,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: height * 0.04),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomButton(
                            text: "Get a Quote",
                            onTap: () {},
                            height: height * 0.06,
                            width: width * 0.15,
                            color: redColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Right section with the image
                Expanded(
                  flex: width > 800 ? 1 : 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Center(
                      child: Image.asset(
                        "assets/images/screen.png",
                        height: width > 800 ? height * 0.8 : height * 0.4,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // About Us section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "ABOUT US",
              style: TextStyle(
                fontSize: width > 600 ? 60 : 40, // Adjust font size dynamically
                color: redColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Mobologics is an experienced Mobile App development and Digital Marketing Company equipped with modern programming languages, powerful tools, efficient developers and digital marketing experts to create the best user experience. We are on a mission to make friendly and fast mobile apps and help you get maximum downloads using our effective digital marketing solutions.",
              style: TextStyle(
                fontSize: width > 600 ? 18 : 14, // Adjust font size dynamically
              ),
            ),
          ),
          SizedBox(height: height * 0.2),
        ],
      ),
    );
  }
}
