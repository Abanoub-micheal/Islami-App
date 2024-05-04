import 'package:flutter/material.dart';

class VersesWidget extends StatelessWidget {

  String content;
  int index;

  VersesWidget(this.content, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      child: Text('$content {${index+1}}',textDirection:TextDirection.rtl ,textAlign: TextAlign.center,style: TextStyle(
        fontSize: 20
      ),),
    );
  }
}
