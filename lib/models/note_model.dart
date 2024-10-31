import 'package:flutter/material.dart';

class NoteModel{
  final Color color;
  final String? title;
  final String? subTitle;
  final String? date;
  NoteModel({this.title, this.subTitle, this.date, required this.color});
}