import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesViewBody extends StatelessWidget {
  NotesViewBody({super.key});
  List<Widget> listItem = [
    NoteItem(),
    NoteItem(),
    NoteItem(),
    NoteItem(),
    NoteItem(),
    NoteItem(),
    NoteItem(),
    NoteItem(),
    NoteItem(),
    NoteItem(),
    NoteItem(),
    NoteItem(),
    NoteItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:24,right: 24,top:24),
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
              padding: const EdgeInsets.only(top:16),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                separatorBuilder: (context,index){
                  return SizedBox(height: 20,);
                },
                  itemCount: listItem.length,
                  itemBuilder: (context, index) {
                    return listItem[index];
                  }),
            ),
          )
        ],
      ),
    );
  }
}
