import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/utils/constants.dart';
import 'package:mobologics_web/widgets/custom_button.dart';
import 'package:mobologics_web/widgets/services_tab.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = width < 600;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title Section
            Align(
              alignment: isMobile ? Alignment.center : Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Our ",
                      style: GoogleFonts.poppins(
                        color: whiteColor,
                        fontSize: isMobile ? 40 : 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "Services",
                      style: GoogleFonts.poppins(
                        color: blueColor,
                        fontSize: isMobile ? 40 : 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.03),

            // Tabs Section
            isMobile
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ServiceTab(
                            title: services[0]['title']!,
                            isActive: _activeIndex == 0,
                            onTap: () => setState(() => _activeIndex = 0),
                          ),
                          SizedBox(width: width * 0.03),
                          ServiceTab(
                            title: services[1]['title']!,
                            isActive: _activeIndex == 1,
                            onTap: () => setState(() => _activeIndex = 1),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ServiceTab(
                            title: services[2]['title']!,
                            isActive: _activeIndex == 2,
                            onTap: () => setState(() => _activeIndex = 2),
                          ),
                          SizedBox(width: width * 0.03),
                          ServiceTab(
                            title: services[3]['title']!,
                            isActive: _activeIndex == 3,
                            onTap: () => setState(() => _activeIndex = 3),
                          ),
                        ],
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      services.length,
                      (index) => ServiceTab(
                        title: services[index]['title']!,
                        isActive: _activeIndex == index,
                        onTap: () => setState(() => _activeIndex = index),
                      ),
                    ),
                  ),
            SizedBox(height: height * 0.04),

            // Content Section for Desktop and Mobile
            isMobile
                ? Column(
                    children: [
                      // Image
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: Image.asset(
                          services[_activeIndex]['image']!,
                          key: ValueKey<int>(_activeIndex),
                          fit: BoxFit.contain,
                          width: width * 0.8,
                          height: height * 0.4,
                        ),
                      ),
                      SizedBox(height: height * 0.03),

                      // Description
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Text(
                          services[_activeIndex]['description']!,
                          style: GoogleFonts.poppins(
                            color: whiteColor,
                            fontSize: 16,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: height * 0.05),

                      // Button
                      CustomButton(
                        text: "Request Services",
                        onTap: () {
                          context.go('/contact');
                        },
                        height: height * 0.07,
                        width: width * 0.8,
                        color: redColor,
                        fontSize: 18,
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Description Section
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              services[_activeIndex]['description']!,
                              style: GoogleFonts.poppins(
                                color: whiteColor,
                                fontSize: 18,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: height * 0.1),
                            CustomButton(
                              text: "Request Services",
                              onTap: () {
                                context.go('/contact');
                              },
                              height: height * 0.075,
                              width: width * 0.22,
                              color: redColor,
                              fontSize: 21,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: width * 0.05),

                      // Image Section
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Image.asset(
                            services[_activeIndex]['image']!,
                            key: ValueKey<int>(_activeIndex),
                            fit: BoxFit.contain,
                            width: width * 0.4,
                            height: height * 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
