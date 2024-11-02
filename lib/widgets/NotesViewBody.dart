import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_states.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesViewBody extends StatefulWidget {
  NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
// trigger cubit the Logic
  List<NoteModel>? notesList ;
  @override
  void initState() {
    super.initState();
     BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    notesList = BlocProvider.of<NotesCubit>(context).notesList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
            child: Column(
              children: [
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
                          Icons.search_rounded,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.separated(
                        padding: EdgeInsets.zero,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemCount:notesList!.length,
                        itemBuilder: (context, index) {
                          return NoteItem(model: notesList![index]);
                        }),
                  ),
                )
              ],
            ));
      },
    );
  }
}
