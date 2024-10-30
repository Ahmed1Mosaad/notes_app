import 'package:flutter/material.dart';
import 'package:notes_app/models/model_item.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesViewBody extends StatelessWidget {
  NotesViewBody({super.key});
  List<Widget> listItem = [
    NoteItem(model: ItemModel(color: Colors.red)),
    NoteItem(model: ItemModel(color: Colors.green)),
    NoteItem(model: ItemModel(color: Colors.blue)),
    NoteItem(model: ItemModel(color: Colors.yellow)),
    NoteItem(model: ItemModel(color: Colors.orange)),
    NoteItem(model: ItemModel(color: Colors.pink)),
    NoteItem(model: ItemModel(color: Colors.brown)),
    NoteItem(model: ItemModel(color: Colors.purple)),
    NoteItem(model: ItemModel(color: Colors.deepOrangeAccent)),
    NoteItem(model: ItemModel(color: Colors.yellowAccent)),
    NoteItem(model: ItemModel(color: Colors.lightGreen)),
    NoteItem(model: ItemModel(color: Colors.redAccent)),
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