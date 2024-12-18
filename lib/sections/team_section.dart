import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/utils/constants.dart';
import 'package:mobologics_web/widgets/team_member.dart';

class TeamSection extends StatefulWidget {
  const TeamSection({Key? key}) : super(key: key);

  @override
  State<TeamSection> createState() => _TeamSectionState();
}

class _TeamSectionState extends State<TeamSection> {
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
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Team",
                    style: GoogleFonts.poppins(
                        color: blueColor,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.028),
            Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  child: Row(
                    children: List.generate(
                      teamMembers.length,
                      (index) {
                        return Row(
                          children: [
                            TeamMember(
                              image: teamMembers[index]['image']!,
                              name: teamMembers[index]['name']!,
                              designation: teamMembers[index]['designation']!,
                            ),
                            if (index != teamMembers.length - 1)
                              Container(
                                height: height * 0.2, // Adjust divider height
                                width: 1, // Divider thickness
                                color: whiteColor.withOpacity(0.5),
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.05),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
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
