import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(String? value)? onSaved;
  CustomTextFormField({
    required this.hintText,
    this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter a Good Text please';
        } else if (hintText == 'Content' && value.length < 5) {
          return 'Enter a text more than 5 letters';
        } else {
          return null;
        }
      },
      maxLines: hintText == 'Content' ? 5 : 1,
      cursorColor: const Color.fromARGB(255, 33, 243, 236),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        hintText: hintText,
        hintStyle: TextStyle(color: kPrimaryColor),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      ),
    );
  }
}
