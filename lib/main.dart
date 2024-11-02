import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';

import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/NotesView.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // تهيئة النظام
  WidgetsFlutterBinding.ensureInitialized();
  /*
getApplicationDocumentsDirectory():
هذه الدالة تعيد مسار مجلد خاص بالتطبيق على الجهاز، حيث يمكن للتطبيق تخزين الملفات (مثل قاعدة البيانات، أو الملفات النصية) والتي لا يتم حذفها إلا عند حذف التطبيق نفسه.
  */
  
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

   await Hive.openBox<NoteModel>(kNotesBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(NotesApp());

}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins', brightness: Brightness.dark),
      home: NotesView(),
    );
  }
}
