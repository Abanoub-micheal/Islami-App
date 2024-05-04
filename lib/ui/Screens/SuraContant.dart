import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/models/SuraModel.dart';
import 'package:quran_app/ui/widgets/versesWidget.dart';

class SuraContent extends StatefulWidget {
  static const String routeName = 'sura-contant';

  SuraContent({super.key});

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    SuraModel argu =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFile(argu.index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/backgroundAPP.png',
          ),
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              argu.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          body: verses.isEmpty ?
          Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : Container(
            padding: EdgeInsets.only(right: 20,left: 20),
                margin: EdgeInsets.symmetric(vertical: 30),

                child: Card(
                            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
                            ),
                  child: ListView.separated(separatorBuilder: (context, index) {
                    return Divider(indent:30,
                      endIndent: 30,
                      color: Theme.of(context).primaryColor,
                    );
                  },
                      itemBuilder: (context, index) {
                        return VersesWidget(verses[index],index);
                      },
                      itemCount: verses.length),
                ),
              )),
    );
  }
 void loadFile(int index) async {
    String suraDetails =
        await rootBundle.loadString('assets/suraContent/${index+1}.txt');
    verses = suraDetails.split('\n');
    setState(() {});
  }
}
