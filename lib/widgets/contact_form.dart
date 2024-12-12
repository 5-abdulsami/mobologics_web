import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/custom_button.dart';
import 'package:mobologics_web/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactForm extends StatelessWidget {
  final double width;
  final double height;
  const ContactForm({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var descriptionController = TextEditingController();

    //submit form
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

    return Center(
      // main column
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Name",
                          style: GoogleFonts.poppins(
                              fontSize: width > 600 ? 17 : 14,
                              color: whiteColor,
                              fontWeight: FontWeight.w500,
                              height: 2.5),
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
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Email",
                          style: GoogleFonts.poppins(
                              fontSize: width > 600 ? 17 : 14,
                              color: whiteColor,
                              fontWeight: FontWeight.w500,
                              height: 2.5),
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
                  ],
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Text(
                  "Your Message",
                  style: GoogleFonts.poppins(
                      fontSize: width > 600 ? 17 : 14,
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                      height: 2.5),
                ),
                CustomTextfield(
                  width: width * 0.45,
                  controller: descriptionController,
                  hintText: "Message",
                  maxLines: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          CustomButton(
            color: blueColor,
            width: width * 0.15,
            height: height * 0.07,
            text: "Send Message",
            onTap: () => _submitForm(),
            icon: Icons.send,
          ),
        ],
      ),
    );
  }
}
