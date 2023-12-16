import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final hinttext;
  final TextEditingController controller;
  final prefixicon;
  final bool obscureText;
  final String? Function(String?)? validator;
  const CustomTextInput({
    Key? key,
    this.hinttext,
    required this.controller,
    this.prefixicon,
    required this.obscureText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width - 56,
      height: 50,
      margin: EdgeInsets.only(left: 28, right: 28),
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        controller: controller, // Assign the controller to the TextField
        decoration: InputDecoration(
          suffixIcon: prefixicon, // Add the prefix icon
          filled: true,
          fillColor: Colors.white, // Fill color of the text input
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28.0),
              borderSide:
                  BorderSide(color: Color(0xFAFEFC), width: 1) // Border radius
              ),
          hintText: hinttext, // Placeholder text
          hintStyle: TextStyle(color: Colors.black),
          contentPadding: EdgeInsets.all(10.0),
        ),
        style: TextStyle(color: Colors.black), // Text color
      ),
    );
  }
}
