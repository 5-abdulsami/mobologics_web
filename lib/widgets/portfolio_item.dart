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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Adjust container and image sizes dynamically
    final containerWidth = mobileView ? width * 0.8 : width * 0.3;
    final containerHeight = mobileView ? height * 0.4 : height * 0.5;
    final imageWidth = mobileView ? containerWidth * 0.7 : containerWidth * 0.8;
    final imageHeight =
        mobileView ? containerHeight * 0.4 : containerHeight * 0.5;

    return Container(
      width: containerWidth,
      height: containerHeight,
      padding: EdgeInsets.all(containerWidth * 0.05),
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
            width: imageWidth,
            height: imageHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: containerHeight * 0.05),
          // App name (title)
          Text(
            title,
            style: GoogleFonts.poppins(
              color: whiteColor,
              fontSize: mobileView ? 16 : 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: containerHeight * 0.02),
          // Description text
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: whiteColor,
              fontSize: mobileView ? 12 : 14,
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
