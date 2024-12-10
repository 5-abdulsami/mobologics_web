import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';

Widget HomeDescriptionText() {
  return Text(
    "We are a dynamic technology company offering comprehensive solutions in mobile app development, web app development, graphic design, and digital marketing. Our expert team leverages cutting-edge tools and strategies to deliver high-quality, user-centric products that drive business growth and enhance brand presence in the digital landscape.",
    style: GoogleFonts.poppins(
      color: whiteColor,
      fontSize: 17,
      fontWeight: FontWeight.w300,
    ),
    textAlign: TextAlign.justify,
  );
}
