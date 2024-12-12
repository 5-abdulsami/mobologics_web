import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  String filter = "All";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<String> filters = [
      "All",
      "Mobile Apps",
      "Web Apps",
      "Graphics Designing",
      "Digital Marketing"
    ];

    return Column(
      children: [
        Text("Our Services"),
        SizedBox(
          height: height * 0.06,
        ),
      ],
    );
  }
}
