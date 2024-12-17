import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';

class PortfolioItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final bool mobileView;

  const PortfolioItem({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    this.mobileView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: mobileView
          ? width * 0.25
          : width * 0.4, // Adjust image size for better fit
      height: mobileView ? height * 0.3 : height * 0.4,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: textFieldColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // App icon (image)
          Container(
            width: mobileView
                ? width * 0.3
                : width * 0.4, // Adjust image size for better fit
            height: mobileView
                ? height * 0.1
                : height * 0.2, // Adjust image size for better fit
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          // App name (title)
          Text(
            title,
            style: GoogleFonts.poppins(
              color: whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.01),
          // Description text
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: whiteColor,
              fontSize: 14,
              height: 1.5,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
