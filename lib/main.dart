import 'package:flutter/material.dart';
import 'package:notes_app/views/NotesView.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
@override
Widget build (BuildContext context){
  return MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark
    ),
    home: NotesView(),
  );
}
}