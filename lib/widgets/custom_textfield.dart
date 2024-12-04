import 'package:flutter/material.dart';
import 'package:mobologics_web/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  IconData? icon;
  int? maxLines;
  String? Function(String? value)? validator;

  CustomTextfield({
    super.key,
    required this.controller,
    this.icon,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints(maxWidth: 550),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: blueColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: blueColor),
          ),
        ),
      ),
    );
  }
}
