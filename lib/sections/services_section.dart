import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/custom_button.dart';
import 'package:mobologics_web/widgets/services_tab.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  // Active tab index
  int _activeIndex = 0;

  // List of service descriptions
  final List<Map<String, String>> services = [
    {
      'title': 'Mobile Apps',
      'description':
          'Empowering businesses with cutting-edge mobile solutions, we create user-friendly, high-performance mobile applications. From native to cross-platform development, our apps are tailored to meet your unique requirements and ensure a seamless user experience.',
      'image': 'assets/images/mobile_app_development.png',
    },
    {
      'title': 'Web Apps',
      'description':
          'Delivering top-notch web applications, we specialize in building responsive, scalable, and secure solutions. Our web apps are designed to streamline your business processes and provide an engaging experience for your users across all devices.',
      'image': 'assets/images/web_app_development.png',
    },
    {
      'title': 'Digital Marketing',
      'description':
          'Maximize your online presence with our data-driven digital marketing strategies. From SEO and social media marketing to PPC campaigns, we help your brand connect with the right audience, enhance visibility, and drive measurable results.',
      'image': 'assets/images/digital_marketing.png',
    },
    {
      'title': 'Graphics Design',
      'description':
          'Transform your brand’s identity with our visually compelling graphic designs. We craft innovative designs that resonate with your target audience, including logos, brochures, banners, and other creative assets to leave a lasting impression.',
      'image': 'assets/images/graphics_designing.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isMobileView = width < 600; // Check if the screen is mobile-sized

    return SingleChildScrollView(
      // Make the content scrollable
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.07),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Our ",
                    style: GoogleFonts.poppins(
                        color: whiteColor,
                        fontSize: isMobileView ? 40 : 60,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "Services",
                    style: GoogleFonts.poppins(
                        color: blueColor,
                        fontSize: isMobileView ? 40 : 60,
                        fontWeight: FontWeight.bold)),
              ]),
            ),
            SizedBox(height: height * 0.024),
            // Tabs Row
            isMobileView
                ? Column(
                    children: List.generate(
                      services.length,
                      (index) => ServiceTab(
                        title: services[index]['title']!,
                        isActive: _activeIndex == index,
                        onTap: () {
                          setState(() {
                            _activeIndex = index;
                          });
                        },
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      services.length,
                      (index) => ServiceTab(
                        title: services[index]['title']!,
                        isActive: _activeIndex == index,
                        onTap: () {
                          setState(() {
                            _activeIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
            SizedBox(height: height * 0.01),
            // Content Section
            isMobileView
                ? Column(
                    children: [
                      // Text Section
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Text(
                          services[_activeIndex]['description']!,
                          style: GoogleFonts.poppins(
                            color: whiteColor,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      // Button Section
                      CustomButton(
                        text: "Request Services",
                        onTap: () {
                          context.go('/contact');
                        },
                        height: height * 0.075,
                        width: width * 0.5,
                        color: redColor,
                        fontSize: 18,
                      ),
                      SizedBox(height: height * 0.05),
                      // Image Section
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
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
                        ),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              services[_activeIndex]['description']!,
                              style: GoogleFonts.poppins(
                                color: whiteColor,
                                fontSize: 18,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: height * 0.08),
                            CustomButton(
                              text: "Request Services",
                              onTap: () {
                                context.go('/contact');
                              },
                              height: height * 0.075,
                              width: width * 0.17,
                              color: redColor,
                              fontSize: 21,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: width * 0.07),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
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
