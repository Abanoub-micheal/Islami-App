import 'package:flutter/material.dart';
import 'package:quran_app/ui/Screens/HadethTab.dart';
import 'package:quran_app/ui/Screens/RadioTab.dart';
import 'package:quran_app/ui/Screens/TasbehTab.dart';
import 'package:quran_app/ui/Screens/quranTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex=0;

  List<Widget> tabs=[
    QuranTab(),
    HadethTab(),
    TasbehTab(),
    RadioTab(),
  ];

  @override
  Widget build(BuildContext context) {
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
          toolbarHeight: 35,
          title: Text(
            'اسلامى',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body:tabs[selectIndex] ,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectIndex=index;
            });
          },
            currentIndex: selectIndex,items: [
          BottomNavigationBarItem(
            icon: ImageIcon(size: 40,
              AssetImage(
                'assets/icons/quran.png',
              ),
            ),
            label: 'quran',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(size: 40,
              AssetImage(
                'assets/icons/quran-quran-svgrepo-com.png',
              ),
            ),
            label: 'Hadeth',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(size: 40,
              AssetImage(
                'assets/icons/sebha.png',
              ),
            ),
            label: 'Sebha',
            backgroundColor: Theme.of(context).primaryColor,
          ),

          BottomNavigationBarItem(
            icon: ImageIcon(size: 40,
              AssetImage(
                'assets/icons/radio_blue.png',
              ),
            ),
            label: 'Radio',
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ]),
      ),
    );
  }
}
