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

    // Adjust container sizes dynamically
    final containerWidth = mobileView ? width * 0.85 : width * 0.4;
    final imageHeight = mobileView ? height * 0.2 : height * 0.3;

    return Container(
      width: containerWidth,
      padding: EdgeInsets.all(containerWidth * 0.05),
      decoration: BoxDecoration(
        color: textFieldColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // App icon (image)
          Container(
            height: imageHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 10),
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
          const SizedBox(height: 8),
          // Description text
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: whiteColor,
              fontSize: mobileView ? 12 : 14,
              height: 1.4,
            ),
            maxLines: null, // Allows for dynamic height based on text length
          ),
        ],
      ),
    );
  }
}
