import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note-cubit.dart/add_note_cubit.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(InitialNoteState()) {
    // fetchAllNotes();
  }
  NoteModel? note;
  
  List<NoteModel>? notesList;
  fetchAllNotes() {
    final fetchNote = Hive.box<NoteModel>(kNotesBox);
    notesList = fetchNote.values.toList();

    emit(SuccessNoteState(notesList: notesList!));
  }
}
