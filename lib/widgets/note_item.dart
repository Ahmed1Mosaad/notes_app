import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Color(0xFFFFCC80),
      borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 18,top:18,bottom:18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              
              title: Text(
                'Flutter Tips',
                style: TextStyle(color: Colors.black, fontSize: 28),
              ),
              subtitle: Padding(
                padding: EdgeInsets.symmetric(vertical:24),
                child: Text(
                  'Build Your career with Ahmed Mosaad',
                  style:
                      TextStyle(color: Colors.black.withOpacity(.6), fontSize: 18),
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(bottom:48.0),
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: Text(
                  'Jan31 , 2001',
                  style:
                      TextStyle(color: Colors.black.withOpacity(.6), fontSize: 16),
                ),
              ),
        
          ],
        ),
      ),
    );
  }
}
