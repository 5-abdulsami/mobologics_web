import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';

class TeamMember extends StatelessWidget {
  final String image;
  final String name;
  final String designation;
  final bool mobileView;

  const TeamMember({
    Key? key,
    required this.image,
    required this.name,
    required this.designation,
    this.mobileView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Define responsive container sizes
    final avatarRadius = mobileView ? width * 0.15 : width * 0.075;
    final nameFontSize = mobileView ? width * 0.04 : width * 0.021;
    final designationFontSize = mobileView ? width * 0.034 : width * 0.014;
    final spacing = mobileView ? height * 0.015 : height * 0.01;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Circle Avatar
        CircleAvatar(
          radius: avatarRadius,
          backgroundImage: AssetImage(image),
        ),
        SizedBox(height: spacing),
        // Name
        Text(
          name,
          style: GoogleFonts.poppins(
            color: whiteColor,
            fontSize: nameFontSize,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: spacing),
        // Designation
        Text(
          designation,
          style: GoogleFonts.poppins(
            color: whiteColor.withOpacity(0.7),
            fontSize: designationFontSize,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
