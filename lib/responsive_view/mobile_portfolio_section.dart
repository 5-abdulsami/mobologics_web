import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/utils/constants.dart';
import 'package:mobologics_web/widgets/portfolio_item.dart';
import 'package:url_launcher/url_launcher.dart';

class MobilePortfolio extends StatelessWidget {
  final double height;
  final double width;
  MobilePortfolio({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "Our ",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "Portfolio",
                  style: GoogleFonts.poppins(
                      color: redColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            SizedBox(height: height * 0.02),
            // Display portfolio items in two columns
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: width * 0.05,
                mainAxisSpacing: height * 0.05,
                childAspectRatio: 0.75, // Adjust this to fit the items better
              ),
              itemCount: portfolioItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () =>
                      launchURL(context, portfolioItems[index]['link']!),
                  child: PortfolioItem(
                    mobileView: true,
                    title: portfolioItems[index]['title']!,
                    description: portfolioItems[index]['description']!,
                    image: portfolioItems[index]['image']!,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
