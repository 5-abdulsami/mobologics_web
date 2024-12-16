// PortfolioItem Widget
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';

class PortfolioItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const PortfolioItem({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.3, // Adjust the width for each portfolio item
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
            width: width * 0.2, // Adjust image size
            height: width * 0.2, // Adjust image size
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
          // App name (title)
          Text(
            title,
            style: GoogleFonts.poppins(
              color: whiteColor,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.008),
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
