import 'package:flutter/material.dart';
import 'package:quran_app/models/SuraModel.dart';
import 'package:quran_app/ui/Screens/SuraContant.dart';

class SuraClick extends StatelessWidget {
  SuraClick({super.key, required this.title,required this.index});

  String title;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        enableFeedback: true,
        onTap: () {
         Navigator.pushNamed(context, SuraContent.routeName,arguments: SuraModel(title, index));
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
