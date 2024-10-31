import 'package:flutter/material.dart';
import 'package:notes_app/widgets/Item_showModelBottemSheet.dart';
import 'package:notes_app/widgets/NotesViewBody.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class NotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
              context: context,
              builder: (context) {
                return ShowModalBottomSheetItem();
              });
        },
        shape: CircleBorder(),
        backgroundColor: Color.fromARGB(255, 32, 232, 229),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
