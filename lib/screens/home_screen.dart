import 'package:flutter/material.dart';
import 'package:mobologics_web/responsive_view/mobile_home.dart';
import 'package:mobologics_web/screens/about_us_section.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/custom_button.dart';
import 'package:mobologics_web/widgets/highlight_container.dart';
import 'package:mobologics_web/widgets/tagline.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late final PageController _pageController;

  final List<String> services = [
    'Mobile App Development',
    'Web App Development',
    'Digital Marketing',
    'Graphics Designing',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage:
            1000); // Start from a high initial page for smooth infinite scrolling
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          currentIndex++;
        });
        _pageController.nextPage(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        // desktop view
        if (constraints.maxWidth > 800) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height,
                  child: Row(
                    children: [
                      // Left section with the text and button
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.05, top: height * 0.14),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Tagline(),
                              SizedBox(height: height * 0.02),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: HighlightContainer(
                                          text: services[0],
                                          isActive:
                                              currentIndex % services.length ==
                                                  0,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.01),
                                      Expanded(
                                        child: HighlightContainer(
                                          text: services[1],
                                          isActive:
                                              currentIndex % services.length ==
                                                  1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.03),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: HighlightContainer(
                                          text: services[2],
                                          isActive:
                                              currentIndex % services.length ==
                                                  2,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.01),
                                      Expanded(
                                        child: HighlightContainer(
                                          text: services[3],
                                          isActive:
                                              currentIndex % services.length ==
                                                  3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.045),
                              Align(
                                alignment: Alignment.center,
                                child: CustomButton(
                                    text: "Get a Quote",
                                    onTap: () {},
                                    height: height * 0.07,
                                    width: width * 0.165,
                                    color: redColor,
                                    icon: Icons.arrow_forward,
                                    fontSize: 21,
                                    iconSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Right section with the image
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: PageView.builder(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              final actualIndex = index % services.length;

                              return AnimatedBuilder(
                                animation: _pageController,
                                builder: (context, child) {
                                  double opacity = 0.0;
                                  if (_pageController.position.haveDimensions) {
                                    // Calculate the page's fade effect
                                    double pageOffset =
                                        _pageController.page! - index;
                                    opacity = (1 - (pageOffset.abs() * 2))
                                        .clamp(
                                            0.0, 1.0); // More fade-out effect
                                  }
                                  return Opacity(
                                    opacity: opacity,
                                    child: Transform.translate(
                                      offset: const Offset(0,
                                          -30), // Moves the image 20 pixels up
                                      child: child,
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/${services[actualIndex].toLowerCase().replaceAll(" ", "_")}.png',
                                    height: actualIndex == 2
                                        ? height * 0.85
                                        : actualIndex == 3
                                            ? height * 0.7
                                            : height * 0.63,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const AboutUsSection(),
              ],
            ),
          );
        } else {
          return MobileHome(height: height, width: width);
        }
      },
    );
  }
}
