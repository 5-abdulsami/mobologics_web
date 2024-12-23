import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/utils/constants.dart';
import 'package:mobologics_web/widgets/portfolio_item.dart';
import 'package:mobologics_web/widgets/services_tab.dart';

class MobilePortfolio extends StatefulWidget {
  final double height;
  final double width;

  const MobilePortfolio({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<MobilePortfolio> createState() => _MobilePortfolioState();
}

class _MobilePortfolioState extends State<MobilePortfolio> {
  int _activeTabIndex = 0; // 0: All, 1: Android, 2: iOS

  // Get portfolio items based on the active tab
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
    final width = widget.width;
    final height = widget.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Our ",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Portfolio",
                    style: GoogleFonts.poppins(
                      color: redColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            // Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
            ),
            SizedBox(height: height * 0.03),
            // GridView of portfolio items
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: width * 0.05,
                mainAxisSpacing: height * 0.03,
                childAspectRatio: 0.75, // Adjust as needed for item proportions
              ),
              itemCount: getCurrentPortfolioItems().length,
              itemBuilder: (context, index) {
                final item = getCurrentPortfolioItems()[index];
                return InkWell(
                  onTap: () => launchURL(context, item['link']!),
                  child: PortfolioItem(
                    mobileView: true,
                    title: item['title']!,
                    description: item['description']!,
                    image: item['image']!,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
