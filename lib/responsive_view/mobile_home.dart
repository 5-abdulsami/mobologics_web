import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/responsive_view/mobile_about_us_section.dart';
import 'package:mobologics_web/responsive_view/mobile_portfolio_section.dart';
import 'package:mobologics_web/responsive_view/mobile_team_section.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/custom_button.dart';
import 'package:mobologics_web/widgets/highlight_container.dart';
import 'package:mobologics_web/widgets/tagline.dart';

class MobileHome extends StatefulWidget {
  final double height;
  final double width;
  const MobileHome({super.key, required this.height, required this.width});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  int currentIndex = 0; // Track active highlight container
  final List<String> services = [
    'Mobile App Development',
    'Web App Development',
    'Digital Marketing',
    'Graphics Designing',
  ];

  final List<String> images = [
    "assets/images/mobile_app_development.png", // Mobile App Development
    "assets/images/web_app_development.png", // Web App Development
    "assets/images/digital_marketing.png", // Digital Marketing
    "assets/images/graphics_designing.png", // Graphics Designing
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll(); // Start the auto-scroll mechanism when the screen loads
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          currentIndex = (currentIndex + 1) % services.length;
        });
        _startAutoScroll();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(color: bgColor),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: widget.height * 0.055),
              // Tagline at the top
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.width * 0.03),
                child: const Center(
                  child: Tagline(fontSize: 50),
                ),
              ),
              SizedBox(height: widget.height * 0.04),

              // First row of HighlightContainers
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HighlightContainer(
                      mobileView: true,
                      text: services[0],
                      isActive: currentIndex == 0,
                    ),
                    HighlightContainer(
                      mobileView: true,
                      text: services[1],
                      isActive: currentIndex == 1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: widget.height * 0.02),

              // Second row of HighlightContainers
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HighlightContainer(
                      mobileView: true,
                      text: services[2],
                      isActive: currentIndex == 2,
                    ),
                    HighlightContainer(
                      mobileView: true,
                      text: services[3],
                      isActive: currentIndex == 3,
                    ),
                  ],
                ),
              ),
              SizedBox(height: widget.height * 0.04),

              // Custom Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
                child: Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    text: "Get a Quote",
                    onTap: () {},
                    height: widget.height * 0.07,
                    width: widget.width * 0.4,
                    color: redColor,
                    fontSize: 18,
                    iconSize: 15,
                  ),
                ),
              ),
              SizedBox(height: widget.height * 0.1),

              // Animated Image based on the active container
              Center(
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  child: Image.asset(
                    images[currentIndex],
                    key: ValueKey<int>(
                        currentIndex), // Ensure the image updates when currentIndex changes
                    height: widget.height *
                        0.4, // Adjust the height for the image as needed
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: widget.height * 0.1),

              // Mobile About Us Section
              MobileAboutUsSection(height: widget.height, width: widget.width),

              // Mobile Portfolio Section
              MobilePortfolio(height: widget.height, width: widget.width),

              // Mobile Team Section
              MobileTeamSection(height: widget.height, width: widget.width),
            ],
          ),
        ),
      ),
    );
  }
}
