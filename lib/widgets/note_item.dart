import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/EditNoteView.dart';
import 'package:notes_app/widgets/edit_note_view_body.dart';

class NoteItem extends StatelessWidget {
 final NoteModel model;

  const NoteItem({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return EditNoteView();
        }));
      },
      child: Container(
        decoration: BoxDecoration(
        color: Color(model.color),
        borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 18,top:18,bottom: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                
                title: Text(
                  model.title,
                  style: TextStyle(color: Colors.black, fontSize: 28),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(vertical:24),
                  child: Text(
                    model.subTitle,
                    style:
                        TextStyle(color: Colors.black.withOpacity(.6), fontSize: 18),
                  ),
                ),
                trailing: IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(right: 32.0),
                  child: Text(
                    model.date,
                    style:
                        TextStyle(color: Colors.black.withOpacity(.6), fontSize: 16),
                  ),
                ),
          
            ],
          ),
        ),
      ),
    );
  }
}
