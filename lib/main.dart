import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/NotesView.dart';

void main() async{
  //await Hive.initFlutter();
 // await Hive.openBox(kNotesBox);

  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
@override
Widget build (BuildContext context){
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
    fontFamily: 'Poppins',
      brightness: Brightness.dark
    ),
    home: NotesView(),
  );
}
}