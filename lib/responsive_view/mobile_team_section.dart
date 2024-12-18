import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/utils/constants.dart';
import 'package:mobologics_web/widgets/team_member.dart';

class MobileTeamSection extends StatelessWidget {
  final double height;
  final double width;

  const MobileTeamSection({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Our ",
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Team",
                    style: GoogleFonts.poppins(
                      color: blueColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            // GridView for displaying team members
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two members per row
                crossAxisSpacing: width * 0.04,
                mainAxisSpacing: height * 0.02,
                childAspectRatio: 0.8, // Adjust to control aspect ratio
              ),
              itemCount: teamMembers.length,
              itemBuilder: (context, index) {
                return TeamMember(
                  image: teamMembers[index]['image']!,
                  name: teamMembers[index]['name']!,
                  designation: teamMembers[index]['designation']!,
                  mobileView: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
