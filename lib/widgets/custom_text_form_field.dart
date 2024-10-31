import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';


class CustomTextFormField extends StatelessWidget {
  final String hintText;
  
  CustomTextFormField({
    
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: hintText == 'Content'? 5 : 1,
      cursorColor: const Color.fromARGB(255, 33, 243, 236),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:kPrimaryColor),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15)),
        hintText: hintText,
        hintStyle: TextStyle(color:kPrimaryColor),
    
        contentPadding:
            EdgeInsets.symmetric(vertical: 20 , horizontal: 15),
            
      ),
    );
  }
}
