import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/custom_button.dart';
import 'package:mobologics_web/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactForm extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;

  const ContactForm({
    super.key,
    required this.width,
    required this.height,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var descriptionController = TextEditingController();

    // Submit form
    Future<void> _submitForm() async {
      if (_formKey.currentState?.validate() ?? false) {
        try {
          await FirebaseFirestore.instance.collection('contactMessages').add({
            'name': nameController.text,
            'email': emailController.text,
            'message': descriptionController.text,
            'timestamp': FieldValue.serverTimestamp(),
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Message sent successfully!')),
          );
          // Clear the form fields
          nameController.clear();
          emailController.clear();
          descriptionController.clear();
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to send message: $e')),
          );
        }
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name and Email Fields
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name Field
                    Text(
                      "Your Name",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                        height: 2.5,
                      ),
                    ),
                    CustomTextfield(
                      width: width * 0.9,
                      controller: nameController,
                      hintText: "Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),

                    // Email Field
                    Text(
                      "Your Email",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                        height: 2.5,
                      ),
                    ),
                    CustomTextfield(
                      width: width * 0.9,
                      controller: emailController,
                      hintText: "Email",
                      validator: (value) {
                        if (value == null || !value.contains("@")) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name Field
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Name",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: whiteColor,
                              fontWeight: FontWeight.w500,
                              height: 2.5,
                            ),
                          ),
                          CustomTextfield(
                            width: width * 0.21,
                            controller: nameController,
                            hintText: "Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: width * 0.03),

                    // Email Field
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Email",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: whiteColor,
                              fontWeight: FontWeight.w500,
                              height: 2.5,
                            ),
                          ),
                          CustomTextfield(
                            width: width * 0.21,
                            controller: emailController,
                            hintText: "Email",
                            validator: (value) {
                              if (value == null || !value.contains("@")) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          SizedBox(height: height * 0.02),

          // Message Field
          Text(
            "Your Message",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 17,
              color: whiteColor,
              fontWeight: FontWeight.w500,
              height: 2.5,
            ),
          ),
          CustomTextfield(
            width: isMobile ? width * 0.9 : width * 0.45,
            controller: descriptionController,
            hintText: "Message",
            maxLines: 10,
          ),
          SizedBox(height: height * 0.05),

          // Submit Button
          Center(
            child: CustomButton(
              color: blueColor,
              width: isMobile ? width * 0.5 : width * 0.18,
              height: height * 0.07,
              text: "Send Message",
              onTap: () => _submitForm(),
              icon: Icons.send,
              fontSize: 18,
              iconSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
