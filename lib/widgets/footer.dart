import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';

// Define the Footer widget
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      color: bgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            color: textFieldColor,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Text(
            "© Mobologics | All Rights Reserved",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _footerLink(context, "Privacy Policy"),
              _divider(),
              _footerLink(context, "Contact Us"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerLink(BuildContext context, String text) {
    return InkWell(
      onTap: () {
        context.go('/contact');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: blueColor,
            fontSize: 14,
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
}
