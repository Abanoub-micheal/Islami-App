import 'package:flutter/material.dart';
import 'package:quran_app/models/hadethModel.dart';

class HadethContent extends StatelessWidget {
  static const String routeName = 'hadeth-content';

  const HadethContent({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethModel;
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
            hadeth.title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Card(
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              '{${hadeth.title} }',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              hadeth.content,
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
