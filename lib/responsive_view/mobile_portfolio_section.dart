import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/portfolio_item.dart';

class MobilePortfolio extends StatelessWidget {
  final double height;
  final double width;
  MobilePortfolio({super.key, required this.height, required this.width});

  final List<Map<String, String>> portfolioItems = [
    {
      'title': 'Ai Grammar Checker & \nAi Writer',
      'description': 'Developing scalable and intuitive mobile apps.',
      'image': 'assets/images/mobile_app_development.png',
    },
    {
      'title': 'Ai Math Solver',
      'description': 'Building feature-rich web applications.',
      'image': 'assets/images/web_app_development.png',
    },
    {
      'title': 'Live MAPS & GPS Navigation',
      'description': 'Creative designs for all your branding needs.',
      'image': 'assets/images/graphics_designing.png',
    },
    {
      'title': 'Live Video Chat & Ai Friend',
      'description': 'User-centric UI/UX designs that enhance experience.',
      'image': 'assets/images/digital_marketing.png',
    }
  ];

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
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "Portfolio",
                  style: GoogleFonts.poppins(
                      color: redColor,
                      fontSize: 35,
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
                return PortfolioItem(
                  mobileView: true,
                  title: portfolioItems[index]['title']!,
                  description: portfolioItems[index]['description']!,
                  image: portfolioItems[index]['image']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
