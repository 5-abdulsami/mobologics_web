import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/screens/home_screen.dart';
import 'package:mobologics_web/screens/services_screen.dart';
import 'package:mobologics_web/screens/team_screen.dart';
import 'package:mobologics_web/screens/careers_screen.dart';
import 'package:mobologics_web/screens/contact_us_screen.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/footer.dart';

class WebsiteNavigator extends StatefulWidget {
  final int initialIndex;

  const WebsiteNavigator({super.key, required this.initialIndex});

  @override
  State<WebsiteNavigator> createState() => _WebsiteNavigatorState();
}

class _WebsiteNavigatorState extends State<WebsiteNavigator> {
  late int _selectedIndex;

  final List<String> _routes = [
    '/',
    '/services',
    '/team',
    '/careers',
    '/contact',
  ];

  final List<Widget> _pages = const [
    HomeScreen(),
    ServicesScreen(),
    TeamScreen(),
    CareersScreen(),
    ContactUsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onMenuTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    final newRoute = _routes[index];
    GoRouter.of(context).go(newRoute);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    bool isDesktop = width > 800;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isDesktop ? height * 0.12 : height * 0.1,
        backgroundColor: bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: width * 0.04),
              child: Image.asset(
                "assets/images/mobologics_name.png",
                height: isDesktop ? height * 0.06 : height * 0.04,
              ),
            ),
            if (isDesktop)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _buildMenuItems(isDesktop: isDesktop),
              )
            else
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: whiteColor,
                ),
                onPressed: () {
                  _showMobileMenu(context);
                },
              ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _pages[_selectedIndex], // Page content
            const Footer(), // Using the new Footer widget
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMenuItems({required bool isDesktop}) {
    return [
      _menuItem("Home", 0, isDesktop),
      _menuItem("Services", 1, isDesktop),
      _menuItem("Team", 2, isDesktop),
      _menuItem("Careers", 3, isDesktop),
      _menuItem("Contact Us", 4, isDesktop),
    ];
  }

  Widget _menuItem(String title, int index, bool isDesktop) {
    return InkWell(
      onTap: () => _onMenuTap(index),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isDesktop ? 20 : 8.0),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: isDesktop ? 16 : 14,
            color: _selectedIndex == index ? blueColor : Colors.white,
            fontWeight:
                _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // Footer Widget
  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      color: bgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            color: textFieldColor,
          ),
          Text(
            "© 2024 Mobologics | All Rights Reserved",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _footerLink("Privacy Policy"),
              _divider(),
              _footerLink("Terms of Service"),
              _divider(),
              _footerLink("Contact"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String text) {
    return InkWell(
      onTap: () {
        print("$text clicked");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.blueAccent,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        "|",
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: bgColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _buildMenuItems(isDesktop: false).map((item) {
              return ListTile(
                title: item,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
