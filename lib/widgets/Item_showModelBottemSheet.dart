import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class ShowModalBottomSheetItem extends StatelessWidget {
  const ShowModalBottomSheetItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField( hintText: 'Title'),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              
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
                  onPressed: () {},
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
    );
  }
}
