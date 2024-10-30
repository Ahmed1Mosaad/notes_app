import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';


class ShowModalBottomSheetItem extends StatelessWidget {
  const ShowModalBottomSheetItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          CustomTextFormField(
              height: 25, width: 10, hintText: 'Title'),
          SizedBox(
            height: 20,
          ),
          CustomTextFormField(height: 80,width: 10,hintText: 'Content',),
          Expanded(child: SizedBox()),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 33, 243, 236),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                onPressed: () {},
                child: Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
