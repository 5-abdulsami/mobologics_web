import 'package:flutter/material.dart';
import 'package:mobologics_web/utils/colors.dart';
import 'package:mobologics_web/widgets/custom_button.dart';
import 'package:mobologics_web/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var descriptionController = TextEditingController();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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

    return Card(
      margin: EdgeInsets.symmetric(horizontal: width > 800 ? 50 : 20),
      color: whiteColor,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width > 800 ? 80 : 20, vertical: 20),
        child: Center(
          child: Column(
            children: [
              Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: width > 600 ? 70 : 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                "Got a question? We'd love to hear from you. Send us a message\nand we'll respond as soon as possible.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: width > 600 ? 16 : 12),
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name*",
                      style: TextStyle(fontSize: width > 600 ? 17 : 14),
                    ),
                    CustomTextfield(
                      controller: nameController,
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Text(
                      "Email*",
                      style: TextStyle(fontSize: width > 600 ? 17 : 14),
                    ),
                    CustomTextfield(
                      controller: emailController,
                      icon: Icons.mail,
                      validator: (value) {
                        if (value == null || !value.contains("@")) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Text(
                      "Message",
                      style: TextStyle(fontSize: width > 600 ? 17 : 14),
                    ),
                    CustomTextfield(
                      controller: descriptionController,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              CustomButton(
                text: "Send Message",
                onTap: () => _submitForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
