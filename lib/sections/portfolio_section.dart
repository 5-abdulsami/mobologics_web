import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/utils/constants.dart';
import 'package:mobologics_web/widgets/services_tab.dart';
import 'package:mobologics_web/widgets/portfolio_item.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({Key? key}) : super(key: key);

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  int _activeTabIndex = 0; // 0: All, 1: Android, 2: iOS
  final ScrollController _scrollController = ScrollController();
  bool _canScrollLeft = false;
  bool _canScrollRight = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _canScrollLeft = _scrollController.offset > 0;
        _canScrollRight = _scrollController.offset <
            _scrollController.position.maxScrollExtent;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Determines the current portfolio list to display
  List<Map<String, String>> getCurrentPortfolioItems() {
    switch (_activeTabIndex) {
      case 1:
        return androidPortfolioItems;
      case 2:
        return iosPortfolioItems;
      default:
        return allPortfolioItems;
    }
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
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Our ",
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Portfolio",
                    style: GoogleFonts.poppins(
                      color: redColor,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.024),
            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ServiceTab(
                  title: "All",
                  isActive: _activeTabIndex == 0,
                  onTap: () => setState(() => _activeTabIndex = 0),
                ),
                ServiceTab(
                  title: "Android",
                  isActive: _activeTabIndex == 1,
                  onTap: () => setState(() => _activeTabIndex = 1),
                ),
                ServiceTab(
                  title: "iOS",
                  isActive: _activeTabIndex == 2,
                  onTap: () => setState(() => _activeTabIndex = 2),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            // Horizontal Scrolling Portfolio
            Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  child: Row(
                    children: List.generate(
                      getCurrentPortfolioItems().length,
                      (index) {
                        final item = getCurrentPortfolioItems()[index];
                        return Padding(
                          padding: EdgeInsets.only(right: width * 0.05),
                          child: InkWell(
                            onTap: () => launchURL(context, item['link']!),
                            child: PortfolioItem(
                              title: item['title']!,
                              description: item['description']!,
                              image: item['image']!,
                              mobileView: width < 600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Scroll Left Button
                if (_canScrollLeft)
                  Positioned(
                    left: width * 0.02,
                    bottom: height * 0.225,
                    child: GestureDetector(
                      onTap: () {
                        _scrollController.animateTo(
                          _scrollController.offset - width * 0.35,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: height * 0.05),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: blackColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: whiteColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                // Scroll Right Button
                if (_canScrollRight)
                  Positioned(
                    right: width * 0.02,
                    bottom: height * 0.225,
                    child: GestureDetector(
                      onTap: () {
                        _scrollController.animateTo(
                          _scrollController.offset + width * 0.35,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: height * 0.05),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: blackColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: whiteColor,
                          size: 20,
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
