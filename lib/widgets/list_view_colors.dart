import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note-cubit.dart/add_note_cubit.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/widgets/Item_showModelBottemSheet.dart';
import 'package:notes_app/widgets/item_color.dart';
import 'package:notes_app/widgets/list_view_colors.dart';


class ListViewColor extends StatefulWidget {
  final List<Color> colorsList;
  num currentIndex;

  ListViewColor(
      {super.key, required this.colorsList, required this.currentIndex});

  @override
  State<ListViewColor> createState() => _ListViewColorState();
}

class _ListViewColorState extends State<ListViewColor> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.colorsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                widget.currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color =
                    widget.colorsList[index];

                setState(() {});
              },
              child: ItemColor(
                color: widget.colorsList[index],
                isActive: widget.currentIndex == index,
              ),
            );
          }),
    );
  }
}
