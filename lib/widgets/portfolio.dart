import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/custom_button.dart';
import 'package:mobologics_web/widgets/portfolio_item.dart';
import 'package:mobologics_web/widgets/services_tab.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  int _activeIndex = 0;
  final ScrollController _scrollController = ScrollController();
  bool _canScrollLeft = false;
  bool _canScrollRight = true;

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
      'image': 'assets/images/digital_marketing.png', // Add image path
    }
  ];

  @override
  void initState() {
    super.initState();
    // Listen to scroll position changes
    _scrollController.addListener(() {
      // Check if the user has scrolled to the left or right
      if (_scrollController.offset <= 0) {
        setState(() {
          _canScrollLeft = false;
          _canScrollRight = true;
        });
      } else if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        setState(() {
          _canScrollLeft = true;
          _canScrollRight = false;
        });
      } else {
        setState(() {
          _canScrollLeft = true;
          _canScrollRight = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.05,
        ),
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
                      fontSize: 60,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "Portfolio",
                  style: GoogleFonts.poppins(
                      color: redColor,
                      fontSize: 60,
                      fontWeight: FontWeight.bold)),
            ])),
            SizedBox(height: height * 0.024),
            // Horizontal Scrollable Portfolio Items
            Stack(
              clipBehavior: Clip.none, // Allow button to overlap
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController, // Use the ScrollController
                  child: Row(
                    children: List.generate(
                      portfolioItems.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                          right: width * 0.05, // Spacing between items
                        ),
                        child: PortfolioItem(
                          title: portfolioItems[index]['title']!,
                          description: portfolioItems[index]['description']!,
                          image: portfolioItems[index]['image']!,
                        ),
                      ),
                    ),
                  ),
                ),
                // Swipe Left Button
                if (_canScrollLeft)
                  Positioned(
                    left: width * 0.02,
                    bottom: height * 0.225,
                    child: GestureDetector(
                      onTap: () {
                        // Scroll to the previous item
                        _scrollController.animateTo(
                          _scrollController.offset -
                              width * 0.35, // Scroll step backward
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {});
                        },
                        onExit: (_) {
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: height * 0.05),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: whiteColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                // Swipe Right Button
                if (_canScrollRight)
                  Positioned(
                    right: width * 0.02,
                    bottom: height * 0.225,
                    child: GestureDetector(
                      onTap: () {
                        // Scroll to the next item
                        _scrollController.animateTo(
                          _scrollController.offset +
                              width * 0.35, // Scroll step
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {});
                        },
                        onExit: (_) {
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: height * 0.05),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: whiteColor,
                            size: 20,
                          ),
                        ),
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
