import 'package:flutter/material.dart';
import 'package:mobologics_web/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/mobologics_banner.png",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "ABOUT US",
              style: TextStyle(
                fontSize: width > 600 ? 60 : 40, // Adjust font size dynamically
                color: redColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Mobologics is an experienced Mobile App development and Digital Marketing Company equipped with modern programming languages, powerful tools, efficient developers and digital marketing experts to create the best user experience. We are on a mission to make friendly and fast mobile apps and help you get maximum downloads using our effective digital marketing solutions.",
              style: TextStyle(
                fontSize: width > 600 ? 18 : 14, // Adjust font size dynamically
              ),
            ),
          ),
          SizedBox(
            height: height * 0.2,
          ),
        ],
      ),
    );
  }
}
