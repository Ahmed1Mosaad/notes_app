import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note-cubit.dart/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note-cubit.dart/add_note_state.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';
import 'package:notes_app/widgets/item_color.dart';
import 'package:notes_app/widgets/list_view_colors.dart';

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

  static List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.brown,
    Colors.teal,
    Colors.tealAccent,
    Colors.deepOrange,
    Colors.deepPurple,
  ];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static num currentIndex = 100;

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
            // *وتعرض الداتا الجديده refresh نستخدمها عشان تعمل
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
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
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      onSaved: (value) {
                        subTitle = value;
                      },
                      hintText: 'Content',
                    ),
                    ListViewColor(colorsList: colors,currentIndex: 100,),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(double.infinity, 50),
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              final String formatCurrentDate =
                                  DateFormat('dd/mm/yyyy')
                                      .format(DateTime.now());

                              // * sixth Stage trigger cubit (logic)
                              //data بنضيف
                              await BlocProvider.of<AddNoteCubit>(context)
                                  .addNote(NoteModel(
                                      title: title!,
                                      subTitle: subTitle!,
                                      date: formatCurrentDate,
                                      color:
                                          BlocProvider.of<AddNoteCubit>(context)
                                              .color
                                              .value));
                            } else {
                              mode = AutovalidateMode.always;
                            }
                          },
                          child: isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.deepPurple,
                                  ),
                                )
                              : const Text(
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
