import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class EditNoteViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Notes',
                style: TextStyle(fontSize: 33),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.06),
                  ),
                  width: 50,
                  height: 50,
                  child: const Icon(
                    Icons.check,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top:16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFormField(hintText: 'Title'),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    hintText: 'Content',
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
