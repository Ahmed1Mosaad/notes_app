import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class ShowModalBottomSheetItem extends StatefulWidget {
  ShowModalBottomSheetItem({
    super.key,
  });

  @override
  State<ShowModalBottomSheetItem> createState() =>
      _ShowModalBottomSheetItemState();
}

class _ShowModalBottomSheetItemState extends State<ShowModalBottomSheetItem> {
  String? title;
  String? subTitle;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode mode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: mode,
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  title = value;
                },
                hintText: 'Title',
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  subTitle = value;
                },
                hintText: 'Content',
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      } else {
                        mode = AutovalidateMode.always;
                      }
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
