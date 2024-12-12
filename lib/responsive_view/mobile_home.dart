import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/custom_button.dart';

class MobileHome extends StatefulWidget {
  final double height;
  final double width;
  const MobileHome({super.key, required this.height, required this.width});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(color: bgColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/mobile_app_development.png",
                height: widget.height * 0.35,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "WE CREATE AND MARKET\n",
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: "MOBILE APPS",
                    style: GoogleFonts.poppins(
                      color: redColor,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: widget.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
              child: Text(
                "We are a dynamic technology company offering comprehensive solutions in mobile app development, web app development, graphic design, and digital marketing. Our expert team leverages cutting-edge tools and strategies to deliver high-quality, user-centric products that drive business growth and enhance brand presence in the digital landscape.",
                style: GoogleFonts.poppins(
                  color: whiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: widget.height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
              child: Align(
                alignment: Alignment.center,
                child: CustomButton(
                  text: "Get a Quote",
                  onTap: () {},
                  height: widget.height * 0.06,
                  width: widget.width * 0.4,
                  color: redColor,
                ),
              ),
            ),
            SizedBox(height: widget.height * 0.1),
          ],
        ),
      ),
    );
  }
}
