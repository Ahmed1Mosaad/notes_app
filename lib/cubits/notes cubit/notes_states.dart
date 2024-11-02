import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

@immutable
abstract class NotesStates {}

class InitialNoteState extends NotesStates {}


class SuccessNoteState extends NotesStates {
  final List<NoteModel> notesList;

  SuccessNoteState({required this.notesList});
}
