import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note-cubit.dart/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note-cubit.dart/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class ShowModalBottomSheetItem extends StatefulWidget {
  const ShowModalBottomSheetItem({
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

  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteLoading) {
            isLoading = true;
          }
          if (state is AddNoteSuccess) {
            Navigator.of(context).pop();
          }

          if (state is AddNoteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Failure with ${state.errMessage.toString()}')));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 24,
                right: 24,
                top: 24,
                ),

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
                            fixedSize: Size(double.infinity, 50),
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              final String formatCurrentDate = DateFormat('dd/mm/yyyy').format(DateTime.now());
                              
                              // * sixth Stage trigger cubit (logic)
                              await BlocProvider.of<AddNoteCubit>(context)
                                  .addNote(NoteModel(
                                      title: title!,
                                      subTitle: subTitle!,
                                      date:formatCurrentDate,
                                      color: Colors.blue.value));
                            } else {
                              mode = AutovalidateMode.always;
                            }
                          },
                          child: isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.deepPurple,
                                  ),
                                )
                              : Text(
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
        },
      ),
    );
  }
}
