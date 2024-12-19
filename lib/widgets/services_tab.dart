import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';

class ServiceTab extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const ServiceTab({
    Key? key,
    required this.title,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    bool isMobile = width < 600;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.only(right: isMobile ? 8 : 12),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 16,
          vertical: isMobile ? 8 : 12,
        ),
        width: width * (isMobile ? 0.4 : 0.135),
        height: height * (isMobile ? 0.08 : 0.07),
        decoration: BoxDecoration(
          color: isActive ? blueColor : textFieldColor,
          borderRadius: BorderRadius.circular(isMobile ? 20 : 15),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: whiteColor,
              fontSize: isMobile ? 15 : 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
