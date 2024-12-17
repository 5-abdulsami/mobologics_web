import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double width;

  final int? maxLines;
  final String? Function(String? value)? validator;

  const CustomTextfield(
      {super.key,
      required this.controller,
      this.maxLines = 1,
      this.validator,
      required this.hintText,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: validator,
        style: const TextStyle(color: whiteColor),
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: textFieldColor,
          focusColor: textFieldColor,
          hintStyle: GoogleFonts.poppins(
              color: hintTextColor.withOpacity(0.5),
              fontWeight: FontWeight.w500),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
