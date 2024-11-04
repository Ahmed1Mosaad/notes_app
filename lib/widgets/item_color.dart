import 'package:flutter/material.dart';


class ItemColor extends StatelessWidget {
  final bool isActive;
  final Color color;
  const ItemColor({super.key, required this.isActive, required this.color});

  @override
  Widget build(BuildContext conetxt) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: isActive
          ? CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 38,
                backgroundColor: color,
              ),
            )
          : CircleAvatar(
              radius: 38,
              backgroundColor: color,
            ),
    );
  }
}
