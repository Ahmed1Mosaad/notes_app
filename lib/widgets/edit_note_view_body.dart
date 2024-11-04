import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';
import 'package:notes_app/widgets/item_color.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel model;

  const EditNoteViewBody({super.key, required this.model});

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;
  int currentIndex = 100;

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.brown,
    Colors.teal,
    Colors.tealAccent,
    Colors.deepOrange,
    Colors.deepPurple,
  ];

  

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: Column(children: [
          const SizedBox(
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
                onTap: () {
                  widget.model.title = title ?? widget.model.title;
                  widget.model.subTitle = subTitle ?? widget.model.subTitle;
                  widget.model.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.of(context).pop();
                },
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
            padding: EdgeInsets.only(top: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'Title',
                    onChanged: (value) {
                      title = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    hintText: 'Content',
                    onChanged: (value) {
                      subTitle = value;
                    },
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: colors.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              currentIndex = index;
                            widget.model.color =
                                  colors[index].value;

                              setState(() {});
                            },
                            child: ItemColor(
                              color: colors[index],
                              isActive: currentIndex == index,
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
