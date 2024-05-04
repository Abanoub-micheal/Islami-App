import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/models/hadethModel.dart';
import 'package:quran_app/ui/widgets/hadethClick.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    if (allHadeth.isEmpty) {
      loadingAhadeth();
    }
    return Column(
      children: [
        Expanded(flex: 1, child: Image.asset('assets/images/hadeth-image.png')),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text(
          'الاحاديث',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Expanded(
          flex: 3,
          child: allHadeth.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ))
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return HadethClick(hadeth: allHadeth[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Theme.of(context).primaryColor,
                      thickness: 2,
                    );
                  },
                  itemCount: allHadeth.length),
        )
      ],
    );
  }

  List<HadethModel> allHadeth = [];

  void loadingAhadeth() async {
    String ahadth = await rootBundle.loadString('assets/ahadeth.txt');
    List<String> ahadethlist = ahadth.split('#\r\n');
    for (int i = 0; i < ahadethlist.length; i++) {
      List<String> ahadethlines = ahadethlist[i].split('\n');
      String title = ahadethlines[0];
      ahadethlines.removeAt(0);
      String content = ahadethlines.join('\n');

      HadethModel hadeth = HadethModel(title, content);
      allHadeth.add(hadeth);
      setState(() {});
    }
  }
}
