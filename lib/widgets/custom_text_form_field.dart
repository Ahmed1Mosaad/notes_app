import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  final String hintText;
  double width;
  double height;
  CustomTextFormField({
    required this.height,
    required this.width,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15)),
        hintText: hintText,
        hintStyle: TextStyle(color: const Color.fromARGB(255, 33, 243, 236)),
        contentPadding:
            EdgeInsets.symmetric(vertical: height, horizontal: width),
      ),
    );
  }
}
