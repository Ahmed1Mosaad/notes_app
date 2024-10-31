import 'package:hive/hive.dart';
part 'note_model.g.dart';
//* typeAdapter يجب اولا ان تنشئ  extends HiveObject بعد لما تعمل  Hive من  object لكى تستطيع ان تنشئ



@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final int color;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String subTitle;
  @HiveField(3)
  final String date;

  NoteModel(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.color});
}
