import 'package:flutter/material.dart';
import 'package:quran_app/models/hadethModel.dart';
import 'package:quran_app/ui/Screens/HadethContent.dart';

class HadethClick extends StatelessWidget {
  HadethClick({required this.hadeth});

  HadethModel hadeth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, HadethContent.routeName,
              arguments: hadeth);
        },
        child: Text(
          hadeth.title,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
